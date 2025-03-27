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
end