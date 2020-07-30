require './player'
require './board'

RSpec.describe Player do
  let (:player_one) { described_class.new('james', 'x') }

  describe '#initialize' do
    it 'has a name' do
      expect(player_one.name).to eq('james')
    end

    it 'has a mark' do
      expect(player_one.mark).to eq('x')
    end
  end
end