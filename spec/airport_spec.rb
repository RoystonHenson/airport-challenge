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
  end
  
  describe '#land_plane' do
    it 'lands a plane' do
      airport.land_plane(plane)
      expect(airport.apron).to eq([plane])
    end
  
    it 'outputs a landing message' do
      expect { airport.land_plane(plane) }.to output('The plane has landed!').to_stdout 
    end
  end

  describe '#take_off' do
    it 'lets a plane take off' do
      airport.apron = [plane]
      airport.take_off(plane)
      expect(airport.apron).to eq([])
    end

    it 'outputs a take-off message' do
      airport.apron = [plane]
      expect { airport.take_off(plane) }.to output('The plane has taken off!').to_stdout
    end
  end
end