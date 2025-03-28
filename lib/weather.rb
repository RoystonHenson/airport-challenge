module Weather

  def stormy?
    rand(11) >= 7 ? true : false
  end
end