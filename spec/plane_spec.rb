require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double('airport') }

  describe '#land' do
    it 'lands' do
      expect(plane.land(airport)).to eq("The plane has landed at #{airport} airport!")
    end
  end
end