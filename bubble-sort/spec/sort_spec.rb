require './sort'

RSpec.describe Sort do
  describe '#bubble_sort' do
    it 'sorts the array from smallest to largest' do
      expect(subject.bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
    end

    it 'sorts another array from smallest to largest' do
      expect(subject.bubble_sort([2,3,4,12,3,6,7,4,2,2,4,6,8,86,5,4])).to eq([2,2,2,3,3,4,4,4,4,5,6,6,7,8,12,86])
    end
  end
end