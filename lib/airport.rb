require './lib/plane'

class Airport
  attr_reader :capacity
  attr_accessor :apron, :stormy

  STORMY_THRESHOLD = 6
  CAPACITY = 5

  def initialize(capacity=CAPACITY)
    @apron = []
    @stormy = 0
    @capacity = capacity
  end

  def land_plane(plane)
    check_if_full
    check_if_landed(plane)
    stormy? ? stormy_error('It is too stormy to land!') : initiate_landing(plane) 
  end

  def take_off(plane)
    check_if_in_airport(plane)
    stormy? ? stormy_error('It is too stormy to take off!') : initiate_take_off(plane)
  end    

  private

  def passage_of_time
    @stormy = rand(11)
  end

  def stormy?
    stormy > STORMY_THRESHOLD
  end

  def stormy_error(error_message)
    passage_of_time
    raise error_message
  end

  def initiate_landing(plane)
    apron << plane
    print 'The plane has landed!'
    passage_of_time
  end

  def initiate_take_off(plane)
    apron.delete_at(apron.index(plane))
    print 'The plane has taken off!'
    passage_of_time
  end

  def check_if_full
    raise 'The airport is full!' if @apron.size >= CAPACITY
  end

  def check_if_landed(plane)
    raise 'This plane has already landed!' if apron.include?(plane)
  end

  def check_if_in_airport(plane)
    raise 'That plane is not in this airport!' if !apron.include?(plane)
  end
end