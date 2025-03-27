class Plane
  attr_reader :airborne

  def initialize(airborne=false)
    @airborne = airborne
  end

  def land
    flying? ? @airborne = false : raise(already_landed_error)
  end

  def take_off
    !flying? ? @airborne = true : raise(already_flying_error)
    print 'The plane has taken off!'
  end

  private

  def flying?
    @airborne == true
  end

  def already_landed_error
    'This plane has already landed!'
  end

  def already_flying_error
    'The plane has already taken off!'
  end
end