require 'plane'
=begin
describe Plane do
  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'is not flying' do
      expect(plane.airbourne).to eq(false)
    end
  end

  describe '#flying' do
    it 'is flying' do
      plane.flying
      expect(plane.airbourne).to be(true)
    end
  end

  describe '#not_flying' do
    it 'is not flying' do
      plane.not_flying
      expect(plane.airbourne).to eq(false)
    end
  end
=end
end