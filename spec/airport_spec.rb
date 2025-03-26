require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double('plane') }

  before(:each) do
    allow(plane).to receive(:land)
  end

  describe '#initialize' do
    it 'has an apron' do
      expect(airport.apron).to eq([])
    end

    it 'has a capacity of 5' do
      expect(airport.capacity).to eq(5)
    end
  end

  describe '#allow_arrival' do
    it 'accepts the flight arrival' do
      airport.allow_arrival(plane)
      expect(airport.apron).to eq([plane])
    end
  end
end