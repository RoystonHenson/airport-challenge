require 'airport'

describe Airport do
  let(:airport)  { Airport.new }
  let(:plane)    { double('plane') }

  before(:each) do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  describe '#initialize' do
    it 'has an apron' do
      expect(airport.apron).to eq([])
    end

    it 'has a capacity of 5' do
      expect(airport.capacity).to eq(5)
    end
  end

  describe '#permit_landing' do
    it 'allows flight to land' do
      airport.permit_landing(plane)
      expect(airport.apron).to eq([plane])
    end
  end

  describe '#permit_take_off' do
    it 'allows flight to take off' do
      airport.permit_landing(plane)
      airport.permit_take_off(plane)
      expect(airport.apron).to eq([])
    end
  end
end