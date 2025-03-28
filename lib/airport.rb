require './lib/plane'
require './lib/weather'

class Airport
  include Weather

  attr_accessor :apron, :capacity

  CAPACITY = 5

  def initialize(capacity=CAPACITY)
    @apron = []
    @capacity = capacity
  end

  def permit_landing(plane)
    check_weather
    full? ? airport_full_error : @apron << plane
    plane.land
  end

  def permit_take_off(plane)
    check_weather
    plane.take_off
    apron.delete(plane)
  end

  private

  def full?
    @apron.size >= @capacity
  end

  def airport_full_error
    raise('The airport is full!')
  end

  def check_weather
     raise('The weather is too stormy! Try again later.') if stormy?
  end
end