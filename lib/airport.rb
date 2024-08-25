class Airport
  attr_accessor :apron

  def initialize
    @apron = []
  end

  def land_plane(plane)
    apron << plane
    print 'The plane has landed!'
  end

  def take_off(plane)
    apron.delete_at(apron.index(plane))
    print 'The plane has taken off!'
  end
end