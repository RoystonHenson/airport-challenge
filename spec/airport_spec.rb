require 'airport'


describe Airport do
  let(:airport)  { Airport.new }
  let(:plane)    { double('plane') }

  before(:each) do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
  end

  describe '#initialize' do
    context 'with default capacity' do
      it 'has an apron' do
        expect(airport.apron).to eq([])
      end

      it 'has a capacity of 5' do
        expect(airport.capacity).to eq(5)
      end
    end

    context 'with user-specified capacity of 10' do
      it 'has space for 10 planes' do
        airport2 = Airport.new(10)
        expect(airport2.capacity).to eq(10)
      end
    end
  end

  describe '#permit_landing' do
    context 'when airport is not full and weather is not stormy' do
      it 'allows flight to land' do
        allow(airport).to receive(:rand).and_return(6)
        airport.permit_landing(plane)
        expect(airport.apron).to eq([plane])
      end
    end

    context 'when airport is not full but weather is stormy' do
      it 'will throw an error' do
        allow(airport).to receive(:rand).and_return(7)
        expect { airport.permit_landing(plane) }.to raise_error(RuntimeError, 'The weather is stormy! Try again later.')
      end

      it 'will prevent a plane from landing' do
        expect(airport.apron).to eq([])
      end
    end

    context 'when airport is full and weather is not stormy' do
      before(:each) do
        airport.capacity.times { airport.apron << double('plane double') }
      end
      
      it 'will throw an error' do
        allow(airport).to receive(:rand).and_return(6)
        expect { airport.permit_landing(plane) }.to raise_error(RuntimeError, 'The airport is full!')
      end

      it 'will prevent a plane from landing' do
        expect(airport.apron.size).to eq(airport.capacity)
      end
    end
  end

  describe '#permit_take_off' do
    it 'allows flight to take off' do
      allow(airport).to receive(:rand).and_return(6)
      airport.permit_landing(plane)
      airport.permit_take_off(plane)
      expect(airport.apron).to eq([])
    end
  end
end