require './board'

RSpec.describe Board do
  let (:board) { described_class.new }
  let (:player_one) { instance_double(Player, name: 'james', mark: instance_double(Mark, type: 'x')) }
  let (:player_two) { instance_double(Player, name: 'thomas', mark: instance_double(Mark, type: 'o')) }

  describe '#initialize' do
    it 'has 9 tiles' do
      expect(board.tiles.size).to eq(9)  
    end
  end

  describe '#place' do
    it 'can place a mark on an empty tile for player one' do
      board.place(player_one, 0)
      expect(board.tiles).to eq(['x', nil, nil, nil, nil, nil, nil, nil, nil])
    end

    it 'can place a mark on an empty tile for player two' do
      board.place(player_two, 3)
      expect(board.tiles).to eq([nil, nil, nil, 'o', nil, nil, nil, nil, nil])
    end
  end

  describe '#winner?' do
    it 'has ended the game with a winner' do
      board.instance_variable_set(:@tiles, ['x', 'x', 'x', nil, nil, nil, nil, nil, nil])
      expect(board.winner?(player_one)).to eq(player_one)
    end

    it 'has not ended the game' do
      expect(board.winner?(player_one)).to be_nil
    end

    it 'has ended in a draw' do
      board.instance_variable_set(:@tiles, ['x','o','x','o','o','x','x','x','o'])
      expect(board.winner?(player_one)).to be_nil
    end
  end
end