require './lib/plane'

class Airport
  attr_accessor :apron, :stormy

  def initialize
    @apron = []
    @stormy = 0
  end

  def land_plane(plane)
    raise 'It is too stormy to land!' if stormy?
    apron << plane
    print 'The plane has landed!'
  end

  def take_off(plane)
    raise 'It is too stormy to take off!' if stormy?
    apron.delete_at(apron.index(plane))
    print 'The plane has taken off!'
    passage_of_time
  end

  private

  def passage_of_time
    stormy = rand(11)
  end

  def stormy?
    stormy > 6
  end
end