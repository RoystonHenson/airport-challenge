require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double('airport') }

  describe '#land' do
    it 'lands' do
      expect(plane.land).to eq('landed')
    end
  end

  describe '#take_off' do
    it 'takes off' do
      expect { plane.take_off }.to output("The plane has taken off!").to_stdout
    end
  end
end