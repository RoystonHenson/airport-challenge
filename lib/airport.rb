require './lib/plane'

class Airport
    attr_reader :apron, :capacity

  def initialize
    @apron = []
    @capacity = 5
  end

  def allow_arrival(plane)
    plane.land
    apron << plane
  end
end