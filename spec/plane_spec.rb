require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  # Redirect console output so as not to clutter the tests.
  before(:all) do
    @original_stdout = $stdout
    $stdout = File.open(File::NULL, 'w')
  end

  # Close file after tests finish running and reset stdout back to itself.
  after(:all) do
    $stdout.close
    $stdout = @original_stdout
  end

  describe '#initialize' do
    context 'when airborn status not specified' do
      it 'registers as not airborne' do
        expect(plane.airborne).to eq(false)
      end
    end

    context 'when status specified as airborne' do 
      it 'registers as airborne' do
        plane = Plane.new(true)
        expect(plane.airborne).to eq(true)
      end
    end

    context 'when status specified as not airborne' do
      it 'registers as not airborne' do
        plane = Plane.new(false)
        expect(plane.airborne).to eq(false)
      end
    end
  end

  describe '#land' do
    context 'after a plane has landed' do
      it 'it knows it\'s landed' do
        plane.take_off
        plane.land
        expect(plane.airborne).to eq(false)
      end
    end

    context 'when a plane has already landed' do
      it 'will throw an error' do
        expect { plane.land }.to raise_error(RuntimeError, 'This plane has already landed!')
      end
    end
  end

  describe '#take_off' do
    context 'when a landed plane is taking off' do
      it 'knows it\'s taken off' do
        plane.take_off
        expect(plane.airborne).to eq(true)
      end

      it 'confirms take-off' do
        expect { plane.take_off }.to output("The plane has taken off!").to_stdout
      end
    end

    context 'when a plane has already taken off' do
      it 'will throw an error' do
        plane.take_off
        expect { plane.take_off }.to raise_error(RuntimeError, 'The plane has already taken off!')
      end
    end
  end
end