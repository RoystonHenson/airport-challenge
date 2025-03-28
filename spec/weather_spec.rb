require 'weather'

describe Weather do
  let(:dummy_class) { Class.new { include Weather } }

  describe '#stormy?' do
    it 'is not stormy below 7' do
      dummy = dummy_class.new
      allow(dummy).to receive(:rand).and_return(6)
      expect(dummy.stormy?).to eq(false)
    end

    it 'is stormy at 7 or higher' do
      dummy = dummy_class.new
      allow(dummy).to receive(:rand).and_return(7)
      expect(dummy.stormy?).to eq(true)
    end
  end
end