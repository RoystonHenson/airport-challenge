class Airport
  attr_accessor :apron

  def initialize
    @apron = []
  end

  def land_plane(plane)
    apron << plane
    print 'The plane has landed'
  end
end