require './lib/plane'

class Airport
  attr_accessor :apron, :stormy

  def initialize
    @apron = []
    @stormy = 0
  end

  def land_plane(plane)
    if stormy?
      passage_of_time
      raise 'It is too stormy to land!' 
    else
      apron << plane
      print 'The plane has landed!'
      passage_of_time
    end
  end

  def take_off(plane)
    if stormy?
      passage_of_time
      raise 'It is too stormy to take off!'
    else
      apron.delete_at(apron.index(plane))
      print 'The plane has taken off!'
      passage_of_time
    end
  end

  private

  def passage_of_time
    @stormy = rand(11)
  end

  def stormy?
    stormy > 6
  end
end