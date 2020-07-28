require './player'

RSpec.describe Player do
  let (:mark) { instance_double(Mark, type: 'x') }
  let (:player_one) { described_class.new('james', mark) }

  describe '#initialize' do
    it 'has a name' do
      expect(player_one.name).to eq('james')
    end

    it 'has a mark' do
      expect(player_one.mark.type).to eq('x')
    end
  end
end