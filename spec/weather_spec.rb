require 'weather'

describe Weather do
  let(:dummy_class) { Class.new { include Weather } }

  describe '#check_weather' do
    it 'returns an integer' do 
      expect(dummy_class.new.check_weather).to be_a(Integer)
    end

    it '0 or higher' do
      expect(dummy_class.new.check_weather).to be >= 0
    end

    it '10 or lower' do
      expect(dummy_class.new.check_weather).to be <= 10
    end
  end
end