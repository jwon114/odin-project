require './encrypt'

RSpec.describe Encrypt do
  describe '#caesar_cipher' do
    it 'returns "Bmfy f xywnsl!" when "What a string!" has shift factor 5' do
      expect(subject.caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
    end

    it 'returns "Ifmmp Xpsme?" when "Hello World?" has a shift factor of 1' do
      expect(subject.caesar_cipher('Hello World?', 1)).to eq('Ifmmp Xpsme?')
    end

    it 'returns "Why Hello There!" when "Why Hello There!" has a shift factor of 26' do
      expect(subject.caesar_cipher('Why Hello There!', 26)).to eq('Why Hello There!')
    end
  end
end