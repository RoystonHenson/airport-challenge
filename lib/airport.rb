require './lib/plane'
require './lib/weather'

class Airport
  include Weather

  attr_reader :apron, :capacity

  CAPACITY = 5

  def initialize(capacity=CAPACITY)
    @apron = []
    @capacity = capacity
  end

  def permit_landing(plane)
    check_weather
    check_apron(plane)
    plane.land
  end

  def permit_take_off(plane)
    check_weather
    apron.delete(plane)
    plane.take_off
  end

  private

  def check_weather
     raise('The weather is too stormy! Try again later.') if stormy?
  end

  def check_apron(plane)
    full? ? airport_full_error : @apron << plane
  end

  def full?
    @apron.size >= @capacity
  end

  def airport_full_error
    raise('The airport is full!')
  end
end