require './board'

RSpec.describe Board do
  let (:board) { described_class.new }

  describe '#initialize' do
    it 'has 9 tiles' do
      expect(board.tiles.size).to eq(9)  
    end
  end

  describe '#place_mark' do
    it 'can update the board with position and mark' do
      board.place_mark(0, 'x')
      expect(board.tiles).to eq(['x', nil, nil, nil, nil, nil, nil, nil, nil])
    end

    it 'cannot place a mark on a non empty tile for player one' do
      board.instance_variable_set(:@tiles, ['x', nil, nil, nil, nil, nil, nil, nil, nil])
      expect(board.place_mark(0, 'x')).to eq('Not an empty tile')
    end
  end

  describe '#valid_placement?' do
    it 'has no mark' do
      expect(board.valid_placement?(0)).to be_truthy
    end

    it 'has a mark' do
      board.instance_variable_set(:@tiles, ['x', nil, nil, nil, nil, nil, nil, nil, nil])
      expect(board.valid_placement?(0)).to be_falsey
    end
  end

  describe '#render' do
    it 'can draw the board empty' do 
      expect { board.render }.to output("  #{nil} | #{nil}  | #{nil}  \n-----------\n #{nil}  | #{nil}  | #{nil}  \n-----------\n #{nil}  | #{nil}  | #{nil}  \n").to_stdout
    end

    it 'can draw the board with marks' do
      board.instance_variable_set(:@tiles, ['x','o','x','o','o','x','x','x','o'])
      expect { board.render }.to output(" x | o | x \n-----------\n o | o | x \n-----------\n x | x | o \n").to_stdout
    end
  end
end