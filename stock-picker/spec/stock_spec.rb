require './stock'

RSpec.describe Stock do
  describe '#stock_picker' do
    it 'returns the pair of days representing the best day to buy and the best day to sell' do
      expect(subject.stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
    end

    it 'has the highest price day first' do
      expect(subject.stock_picker([10,9,8,7,5,6,7])).to eq([4,6])
    end

    it 'has the lowest price day last' do
      expect(subject.stock_picker([4,5,4,3,1])).to eq([0,1])
    end
  end
end