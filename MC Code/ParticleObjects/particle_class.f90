module particle_class

  use numPrecision
  use universalVariables
  use genericProcedures
  use coord_class,       only : coordList
  use RNG_class,         only : RNG
  use nuclearData_inter, only : nuclearData

  implicit none
  private

  !!
  !! Particle types paramethers
  !!
  integer(shortInt), parameter,public :: P_NEUTRON = 1,&
                                         P_PHOTON  = 2

  !!
  !! Public particle type procedures
  !!
  public :: verifyType
  public :: printType

  !!
  !! Particle compressed for storage
  !!
  type, public :: phaseCoord
    real(defReal)              :: wgt  = 0.0       ! Particle weight
    real(defReal),dimension(3) :: r    = 0.0       ! Global position
    real(defReal),dimension(3) :: dir  = 0.0       ! Global direction
    real(defReal)              :: E    = 0.0       ! Energy
    integer(shortInt)          :: G    = 0         ! Energy group
    logical(defBool)           :: isMG = .false.   ! Is neutron multi-group
    integer(shortInt)          :: type = P_NEUTRON ! Particle physical type
    real(defReal)              :: time = 0.0       ! Particle time position
  contains
    generic    :: assignment(=)  => fromParticle
    generic    :: operator(.eq.) => equal_phaseCoord
    procedure  :: display        => display_phaseCoord
    procedure  :: fromParticle   => phaseCoord_fromParticle

    ! Private procedures
    procedure,private :: equal_phaseCoord
  end type

  !!
  !! Archived state of the particle used for tallying transitions, fission matrixes etc.
  !!
  type, public,extends(phaseCoord) :: particleState
    integer(shortInt)  :: matIdx   = -1   ! Material index where particle is
    integer(shortInt)  :: cellIdx  = -1   ! Cell idx at the lowest coord level
    integer(shortInt)  :: uniqueID = -1   ! Unique id at the lowest coord level
  contains
    generic    :: operator(.eq.) => equal_particleState
    procedure :: fromParticle    => particleState_fromParticle

    ! Private procedures
    procedure,private :: equal_particleState
  end type

  !!
  !! This type represents particle
  !!
  !! In current form it was designed to support neutron and other neutral particles
  !! By extension(inheritance) support for photons or charged particles could be introduced
  !!
  !! In addition to representing a particle by physical parameters, it containes additional
  !! data like RNG pointer. This is to enable access to objects associated with a particlular
  !! particle history from anywhere where a particle was passed. This it works kind of like a
  !! global scope for a specific particle. Such setup should enable particle to control how it
  !! is beeing processed during Monte Carlo transport.
  !!
  !! Particle also contains snapshots (states) at privious points in its history. This is used
  !! for tallying. It is necessary to compare current state with the earlier state to score e.g.
  !! collision probabilities.
  !!
  type, public :: particle
    ! Particle phase space data
    type(coordList)            :: coords
    real(defReal)              :: E         ! Particle Energy
    integer(shortInt)          :: G         ! Particle Energy Group
    real(defReal)              :: w         ! Particle Weight
    real(defReal)              :: time      ! Particle time point

    ! Particle flags
    real(defReal)              :: w0             ! Particle initial weight (for implicit, variance reduction...)
    logical(defBool)           :: isDead
    logical(defBool)           :: isMG
    real(defReal)              :: timeMax = ZERO ! Maximum neutron time before cut-off
    integer(shortInt)          :: fate = 0       ! Neutron's fate after being subjected to an operator
    integer(shortInt)          :: type           ! Particle type

    ! Particle processing information
    class(RNG), pointer        :: pRNG  => null()  ! Pointer to RNG associated with the particle
    class(nuclearData),pointer :: xsData => null() ! Pointer to nuclear data
    real(defReal)              :: k_eff            ! Value of default keff for implicit source generation

    ! Archived snapshots of previous states
    type(particleState)        :: preHistory
    type(particleState)        :: preTransition
    type(particleState)        :: prePath
    type(particleState)        :: preCollision

  contains
     ! Build procedures
    generic              :: build => buildCE, buildMG
    generic              :: assignment(=) => particle_fromPhaseCoord

    ! Inquiry about coordinates
    procedure            :: rLocal
    procedure            :: rGlobal
    procedure            :: dirLocal
    procedure            :: dirGlobal
    procedure            :: nesting
    procedure            :: getCellIdx
    procedure            :: getUniIdx
    procedure            :: matIdx

    ! Operations on coordinates
    procedure            :: moveGlobal
    procedure            :: moveLocal
    procedure            :: rotate
    procedure            :: teleport
    procedure            :: point
    procedure            :: takeAboveGeom
    procedure            :: setMatIdx

    ! Save particle state information
    procedure, non_overridable  :: savePreHistory
    procedure, non_overridable  :: savePreTransition
    procedure, non_overridable  :: savePrePath
    procedure, non_overridable  :: savePreCollision

    ! Debug procedures
    procedure            :: display => display_particle
    procedure            :: typeToChar

    !! Private - Implementation specific procedures
    procedure,private                   :: buildCE
    procedure,private                   :: buildMG
    procedure,non_overridable,private   :: particle_fromPhaseCoord

  end type particle

contains

!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Particle build and assignment procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

  !!
  !! Initialise CE particle
  !! Necessary arguments:
  !!   r   -> Global Position
  !!   dir -> Global direction
  !!   E   -> Energy [MeV]
  !!   w   -> particle weight
  !! Optional arguments:
  !!   t   -> particle time (default = 0.0)
  !!   type-> particle type (default = P_NEUTRON)
  !!
  pure subroutine buildCE(self, r, dir, E, w, t, type)
    class(particle), intent(inout)          :: self
    real(defReal),dimension(3),intent(in)   :: r
    real(defReal),dimension(3),intent(in)   :: dir
    real(defReal),intent(in)                :: E
    real(defReal),intent(in)                :: w
    real(defReal),optional,intent(in)       :: t
    integer(shortInt),intent(in),optional   :: type

    call self % coords % init(r, dir)
    self % E  = E
    self % w  = w
    self % w0 = w

    self % isDead = .false.
    self % isMG   = .false.

    if(present(t)) then
      self % time = t
    else
      self % time = ZERO
    end if

    if(present(type)) then
      self % type = type
    else
      self % type = P_NEUTRON
    end if

  end subroutine buildCE

  !!
  !! Initialise MG particle
  !! Necessary arguments:
  !!   r   -> Global Position
  !!   dir -> Global direction
  !!   G   -> Energy Group
  !!   w   -> particle weight
  !! Optional arguments:
  !!   t   -> particle time (default = 0.0)
  !!   type-> particle type (default = P_NEUTRON)
  !!
  subroutine buildMG(self, r, dir, G, w, t, type)
    class(particle), intent(inout)          :: self
    real(defReal),dimension(3),intent(in)   :: r
    real(defReal),dimension(3),intent(in)   :: dir
    real(defReal),intent(in)                :: w
    integer(shortInt),intent(in)            :: G
    real(defReal),intent(in),optional       :: t
    integer(shortInt),intent(in),optional   :: type

    call self % coords % init(r, dir)
    self % G  = G
    self % w  = w
    self % w0 = w

    self % isDead = .false.
    self % isMG   = .true.

    if(present(t)) then
      self % time = t
    else
      self % time = ZERO
    end if

    if(present(type)) then
      self % type = type
    else
      self % type = P_NEUTRON
    end if

  end subroutine buildMG

  !!
  !! Copy phase coordinates into particle
  !!
  subroutine particle_fromPhaseCoord(LHS,RHS)
    class(particle), intent(inout)  :: LHS
    type(phaseCoord), intent(in)    :: RHS

    LHS % w                     = RHS % wgt
    LHS % w0                    = RHS % wgt
    call LHS % takeAboveGeom()
    LHS % coords % lvl(1) % r   = RHS % r
    LHS % coords % lvl(1) % dir = RHS % dir
    LHS % E                     = RHS % E
    LHS % G                     = RHS % G
    LHS % isMG                  = RHS % isMG
    LHS % type                  = RHS % type
    LHS % time                  = RHS % time

  end subroutine particle_fromPhaseCoord

!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Particle coordinates inquiry procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

  !!
  !! Return the position either at the deepest nested level or a specified level
  !!
  function rLocal(self,n)result(r)
    class(particle), intent(in)             :: self
    integer(shortInt), intent(in), optional :: n
    real(defReal), dimension(3)             :: r
    integer(shortInt)                       :: n_loc

    if(present(n)) then
      n_loc = n
    else
      n_loc = self % coords % nesting
    end if

    r = self % coords % lvl(n_loc) % r

  end function rLocal

  !!
  !! Return the position at the highest level
  !!
  pure function rGlobal(self)result(r)
    class(particle), intent(in) :: self
    real(defReal), dimension(3) :: r

    r = self % coords % lvl(1) % r

  end function rGlobal

  !!
  !! Return the direction either at the deepest nested level or at a specified level
  !!
  function dirLocal(self,n)result(dir)
    class(particle), intent(in) :: self
    integer(shortInt), optional :: n
    real(defReal), dimension(3) :: dir
    integer(shortInt)           :: n_loc

    if(present(n)) then
      n_loc = n
    else
      n_loc = self % coords % nesting
    end if

    dir = self % coords % lvl(n_loc) % dir

  end function dirLocal

  !!
  !! Return the direction at the highest nesting level
  !!
  function dirGlobal(self)result(dir)
    class(particle), intent(in) :: self
    real(defReal), dimension(3) :: dir

    dir = self % coords % lvl(1) % dir

  end function dirGlobal

  !!
  !! Return the lowest nesting level of the particle
  !!
  function nesting(self) result(n)
    class(particle), intent(in) :: self
    integer(shortInt)           :: n

    n = self % coords % nesting

  end function nesting

  !!
  !! Return cell index at a given nesting level n
  !!  If no n is given return for lowest nesting level
  !!
  function getCellIdx(self,n) result(idx)
    class(particle), intent(in)             :: self
    integer(shortInt),optional, intent(in)  :: n
    integer(shortInt)                       :: idx
    integer(shortInt)                       :: n_loc

    if(present(n)) then
      n_loc = n
    else
      n_loc = self % coords % nesting
    end if

    idx = self % coords % lvl(n_loc) % cellIdx

  end function getCellIdx

  !!
  !! Return universe index at a given nesting level n
  !!
  function getUniIdx(self,n) result(idx)
    class(particle), intent(in)             :: self
    integer(shortInt),optional, intent(in)  :: n
    integer(shortInt)                       :: idx
    integer(shortInt)                       :: n_loc

    if(present(n)) then
      n_loc = n
    else
      n_loc = self % coords % nesting
    end if

    idx = self % coords % lvl(n_loc) % uniIdx

  end function getUniIdx

  !!
  !! Return current material index
  !!
  pure function matIdx(self) result(Idx)
    class(particle), intent(in) :: self
    integer(shortInt)           :: idx

    idx = self % coords % matIdx

  end function matIdx

!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Particle operations on coordinates procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

  !!
  !! Move the particle above the geometry
  !! NOTE: regionID & matIdx will be reset!!!
  !!
  subroutine moveGlobal(self,distance)
    class(particle), intent(inout) :: self
    real(defReal), intent(in)      :: distance

    call self % coords % moveGlobal(distance)

  end subroutine moveGlobal

  !!
  !! Move particle in local co-ordinates down to nesting level n
  !!
  subroutine moveLocal(self,distance,n)
    class(particle), intent(inout) :: self
    real(defReal), intent(in)      :: distance
    integer(shortInt), intent(in)  :: n

    call self % coords % moveLocal(distance,n)

  end subroutine moveLocal

  !!
  !! Rotate particle
  !!  mu  -> cosine of deflection from current direction
  !!  phi -> azimuthal angle of rotation
  !!
  subroutine rotate(self,mu,phi)
    class(particle), intent(inout) :: self
    real(defReal), intent(in)      :: mu
    real(defReal), intent(in)      :: phi

    call self % coords % rotate(mu,phi)

  end subroutine rotate

  !!
  !! Place particle at an arbitrary point in above the geometry
  !!
  subroutine teleport(self, r)
    class(particle), intent(inout)          :: self
    real(defReal), dimension(3), intent(in) :: r

    call self % coords % assignPosition(r)

  end subroutine teleport

  !!
  !! Point particle in direction dir in highest nesting level
  !! Propagates new direction to lower levels
  !!
  subroutine point(self, dir)
    class(particle), intent(inout)          :: self
    real(defReal), dimension(3), intent(in) :: dir

    call self % coords % assignDirection(dir)

  end subroutine point

  !!
  !! Resets the particle's nesting level
  !!
  subroutine takeAboveGeom(self)
    class(particle), intent(inout) :: self

    call self % coords % takeAboveGeom()

  end subroutine takeAboveGeom

  !!
  !! Set Material index for testing purposes
  !!
  pure subroutine setMatIdx(self,matIdx)
    class(particle), intent(inout) :: self
    integer(shortInt), intent(in)  :: matIdx

    self % coords % matIdx = matIdx

  end subroutine setMatIdx

!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Particle save state procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

  !!
  !! Save state of the particle at the beginning of history
  !!
  subroutine savePreHistory(self)
    class(particle), intent(inout) :: self

    self % preHistory = self

  end subroutine savePreHistory

  !!
  !! Save state of the particle at the beginning of history
  !!
  subroutine savePreTransition(self)
    class(particle), intent(inout) :: self

    self % preTransition = self

  end subroutine savePreTransition

  !!
  !! Save state of the particle at the beginning of history
  !!
  subroutine savePrePath(self)
    class(particle), intent(inout) :: self

    self % prePath = self

  end subroutine savePrePath

  !!
  !! Save state of the particle at the beginning of history
  !!
  subroutine savePreCollision(self)
    class(particle), intent(inout) :: self

    self % preCollision = self

  end subroutine savePreCollision

!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Particle debug procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

  !!
  !! Display state of a particle
  !!
  subroutine display_particle(self)
    class(particle), intent(in) :: self
    type(phaseCoord)            :: state

    state = self
    call state % display()
    print *, self % coords % matIdx

  end subroutine display_particle

  !!
  !! Return character that describes the type of particle
  !!
  function typeToChar(self) result(c)
    class(particle), intent(in) :: self
    character(:), allocatable   :: c
    character(2)                :: eType

    if( self % isMG) then
      eType = 'MG'
    else
      eType = 'CE'
    end if

    c = eType // ' ' // trim(printType( self % type))

  end function typeToChar


!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Particle state and phaseCoord procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

  !!
  !! Copy particle into phase coordinates
  !!
  subroutine phaseCoord_fromParticle(LHS,RHS)
    class(phaseCoord), intent(out)  :: LHS
    class(particle), intent(in)      :: RHS

    LHS % wgt  = RHS % w
    LHS % r    = RHS % rGlobal()
    LHS % dir  = RHS % dirGlobal()
    LHS % E    = RHS % E
    LHS % G    = RHS % G
    LHS % isMG = RHS % isMG
    LHS % type = RHS % type
    LHS % time = RHS % time

  end subroutine phaseCoord_fromParticle

  !!
  !! Define equal operation on phase coordinates
  !!  Phase coords are equal if all their components are the same
  !!
  function equal_phaseCoord(LHS,RHS) result(isEqual)
    class(phaseCoord), intent(in) :: LHS
    class(phaseCoord), intent(in) :: RHS
    logical(defBool)              :: isEqual

    isEqual = .true.
    isEqual = isEqual .and. LHS % wgt == RHS % wgt
    isEqual = isEqual .and. all(LHS % r   == RHS % r)
    isEqual = isEqual .and. all(LHS % dir == RHS % dir)
    isEqual = isEqual .and. LHS % time == RHS % time
    isEqual = isEqual .and. LHS % isMG .eqv. RHS % isMG
    isEqual = isEqual .and. LHS % type == RHS % type

    if( LHS % isMG ) then
      isEqual = isEqual .and. LHS % G == RHS % G
    else
      isEqual = isEqual .and. LHS % E == RHS % E
    end if
  end function equal_phaseCoord

  !!
  !! Copy particle state into archive object
  !!
  subroutine particleState_fromParticle(LHS,RHS)
    class(particleState), intent(out) :: LHS
    class(particle), intent(in)       :: RHS

    ! Call superclass procedure
    call phaseCoord_fromParticle(LHS,RHS)

    ! Save all indexes
    LHS % matIdx   = RHS % coords % matIdx
    LHS % uniqueID = RHS % coords % uniqueId()
    LHS % cellIdx  = RHS % coords % cell()

  end subroutine particleState_fromParticle

  !!
  !! Extend equality definition to particle state
  !!
  function equal_particleState(LHS,RHS) result(isEqual)
    class(particleState), intent(in) :: LHS
    type(particleState), intent(in)  :: RHS
    logical(defBool)                 :: isEqual

    ! Call superclass procedure
    isEqual = equal_phaseCoord(LHS,RHS)

    ! Check subclass components for equality
    isEqual = isEqual .and. LHS % matIdx   == RHS % matIdx
    isEqual = isEqual .and. LHS % cellIdx  == RHS % cellIdx
    isEqual = isEqual .and. LHS % uniqueID == RHS % uniqueID

  end function equal_particleState

  !!
  !! Prints state of the phaseCoord
  !!
  subroutine display_phaseCoord(self)
    class(phaseCoord), intent(in) :: self

    print *, self % r, self % dir, self % E, self % G, self % isMG, self % wgt, self % time

  end subroutine display_phaseCoord

!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
!! Misc Procedures
!!<><><><><><><>><><><><><><><><><><><>><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
  !!
  !! Returns .true. if the integer is valid particle type code
  !! Returns .false. otherwise
  !!
  elemental function verifyType(type) result(isValid)
    integer(shortInt), intent(in) :: type
    logical(defBool)              :: isValid

    isValid = .false.

    ! Check against particles types
    isValid = isValid .or. type == P_NEUTRON
    isValid = isValid .or. type == P_PHOTON

  end function verifyType

  !!
  !! Returns character with a description of particle type
  !!
  elemental function printType(type) result(name)
    integer(shortInt), intent(in) :: type
    character(:),allocatable      :: name

    select case(type)
      case(P_NEUTRON)
        name = 'Neutron'

      case(P_PHOTON)
        name = 'Photon'

      case default
        name = 'INVALID PARTICLE TYPE'

    end select
  end function printType

end module particle_class
