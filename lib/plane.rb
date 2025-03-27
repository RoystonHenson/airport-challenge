class Plane
  attr_reader :airborne

  def initialize(airborne=false)
    @airborne = airborne
  end

  def land
    @airborne = false
  end

  def take_off
    @airborne = true
    print 'The plane has taken off!'
  end
end