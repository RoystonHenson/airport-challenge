require 'plane'

describe Plane do
  let(:plane) { Plane.new }

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
    it 'it knows it\'s landed' do
      plane.take_off
      plane.land
      expect(plane.airborne).to eq(false)
    end
  end

  describe '#take_off' do
    it 'knows it\'s taken off' do
      plane.take_off
      expect(plane.airborne).to eq(true)
    end

    it 'confirms take-off' do
      expect { plane.take_off }.to output("The plane has taken off!").to_stdout
    end
  end
end