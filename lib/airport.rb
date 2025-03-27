require './lib/plane'

class Airport
  attr_reader :apron, :capacity

  def initialize
    @apron = []
    @capacity = 5
  end

  def permit_landing(plane)
    plane.land
    apron << plane
  end

  def permit_take_off(plane)
    plane.take_off
    apron.delete(plane)
  end
end