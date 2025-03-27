require './lib/plane'

class Airport
  attr_reader :apron, :capacity

  def initialize
    @apron = []
    @capacity = 5
  end

  def permit_landing(plane)
    full? ? @apron << plane : airport_full_error
    plane.land
    
  end

  def permit_take_off(plane)
    plane.take_off
    apron.delete(plane)
  end

  private

  def full?
    @apron.size < @capacity
  end

  def airport_full_error
    raise('The airport is full!')
  end
end