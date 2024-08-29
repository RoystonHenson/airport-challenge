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
    raise 'The airport is full!' if @apron.size >= CAPACITY
    raise 'This plane has already landed!' if apron.include?(plane)
    if stormy?
      stormy_error('It is too stormy to land!')
    else
      initiate_landing(plane)
    end
  end

  def take_off(plane)
    raise 'That plane is not in this airport!' if !apron.include?(plane)
    if stormy?
      stormy_error('It is too stormy to take off!')
    else
      initiate_take_off(plane)
    end
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
end