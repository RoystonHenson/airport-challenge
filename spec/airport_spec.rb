require 'airport'

describe Airport do
  let(:airport)  { Airport.new }
  let(:airport2) { Airport.new }
  let(:plane)    { double('plane') }

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

  describe '#permit_landing' do
    it 'accepts the flight arrival' do
      airport.permit_landing(plane)
      expect(airport.apron).to eq([plane])
    end
  end

  describe '#landing_check' do
    context 'when a plane has already landed' do
      #allow(:plane).to receive(:airborne)and_return(false)
      it 'raises an error when trying to land again' do
        expect { airport.permit_landing(plane) }.to raise_error(RuntimeError, 'That plane is currently on the ground!')
      end
    end
    context 'when a landed plane tries to land at another airport' do

      it 'raises an error that it is on the ground' do
        expect { airport2.permit_landing(plane) }.to raise_error(RuntimeError, 'That plane is currently on the ground!')
      end
    end
  end
end