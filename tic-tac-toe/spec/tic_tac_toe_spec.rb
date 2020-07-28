require './tic_tac_toe'

RSpec.describe TicTacToe do
  let (:tic_tac_toe) { described_class.new }
  
  describe '#initialize' do
    it 'has a 3x3 board' do
      expect(tic_tac_toe.board).to be_an_instance_of(Board)
    end

    it 'has no players' do
      expect(tic_tac_toe.players).to be_empty
    end
  end

  describe '#add_player' do
    it 'adds player one' do
      
    end

    it 'adds player two' do
      
    end
  end
end