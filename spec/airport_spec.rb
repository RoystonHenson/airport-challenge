require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double('plane') }

  before(:all) do
    @original_stdout = $stdout
    $stdout = File.open(File::NULL, 'w')
  end

  after(:all) do
    $stdout = @original_stdout
  end
    
  describe '#initialize' do
    it 'has an apron to park planes' do
      expect(airport.apron).to eq([])
    end
  
    context 'when not given an argument' do
      it 'has a default capacity of 5' do
        expect(airport.capacity).to eq(5)
      end
    end

    context 'when given an argument' do
      it 'has a default capacity set by user' do
        airport = Airport.new(10)
        expect(airport.capacity).to eq(10)
      end
    end
  end
  
  describe '#land_plane' do
    context 'when weather is good and there is space in the airport' do
      it 'raises error if plane already landed' do
        airport.land_plane(plane)
        airport.stormy = 0
        expect { airport.land_plane(plane) }.to raise_error(RuntimeError, 'This plane has already landed!')
      end

      it 'lands a plane' do
        airport.land_plane(plane)
        expect(airport.apron).to eq([plane])
      end
  
      it 'outputs a landing message' do
        expect { airport.land_plane(plane) }.to output('The plane has landed!').to_stdout 
      end
    end

    context 'when weather is good but the airport if full' do
      it 'raises error for airport full' do
        5.times { airport.apron << double('plane') }
        expect { airport.land_plane(plane) }.to raise_error(RuntimeError, 'The airport is full!')
        expect(airport.apron.size).to eq(5)
      end
    end

    context 'when weather is stormy' do
      it 'raises error preventing landing' do
        airport.stormy = 10
        expect { airport.land_plane(plane) }.to raise_error('It is too stormy to land!')
      end
    end
  end

  describe '#take_off' do
    before(:each) do
      airport.apron = [plane]
    end

    context 'when weather is good' do
      it 'lets a plane take off' do
        airport.take_off(plane)
        expect(airport.apron).to eq([])
      end

      it 'outputs a take-off message' do
        expect { airport.take_off(plane) }.to output('The plane has taken off!').to_stdout
      end
    end

    context 'when weather is stormy' do
      it 'raises error preventing take-off' do
        airport.stormy = 10
        expect { airport.take_off(plane) }.to raise_error(RuntimeError, 'It is too stormy to take off!')
      end
    end
  end


end