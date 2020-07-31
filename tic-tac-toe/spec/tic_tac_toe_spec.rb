require './tic_tac_toe'
require 'pry'

RSpec.describe TicTacToe do
  let (:tic_tac_toe) { described_class.new }
  let (:player_one) { instance_double(Player, name: 'james', mark: 'x') }
  let (:player_two) { instance_double(Player, name: 'thomas', mark: 'o') }

  describe '#initialize' do
    it 'has a 3x3 board' do
      expect(tic_tac_toe.board).to be_an_instance_of(Board)
      expect(tic_tac_toe.board.tiles).to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
    end

    it 'has no players' do
      expect(tic_tac_toe.players).to be_empty
    end

    it 'has not assigned player turn' do
      expect(tic_tac_toe.player_turn).to be_nil
    end
  end

  describe '#add_player' do
    it 'adds player one with name and mark' do
      tic_tac_toe.add_player('james')
      expect(tic_tac_toe.players.size).to eq(1)
      expect(tic_tac_toe.players.first).to be_an_instance_of(Player)
      expect(tic_tac_toe.players.first.name).to eq('james')
      expect(tic_tac_toe.players.first.mark).to eq('x')
    end

    it 'adds players one and sets the initial turn' do
      tic_tac_toe.add_player('james')
      # binding.pry
      expect(tic_tac_toe.player_turn).to be_an_instance_of(Player)
      expect(tic_tac_toe.player_turn).to have_attributes(name: 'james')
    end

    it 'adds player two with name and mark' do
      tic_tac_toe.instance_variable_set(:@players, [player_one])
      tic_tac_toe.add_player('thomas')
      expect(tic_tac_toe.players.size).to eq(2)
      expect(tic_tac_toe.players.last).to be_an_instance_of(Player)
      expect(tic_tac_toe.players.last.name).to eq('thomas')
      expect(tic_tac_toe.players.last.mark).to eq('o')
    end
  end

  describe '#switch_player_turn' do
    it 'alternates the player turn from player one to player two' do
      tic_tac_toe.instance_variable_set(:@players, [player_one, player_two])
      tic_tac_toe.instance_variable_set(:@player_turn, player_one)
      expect { tic_tac_toe.switch_player_turn }.to change { tic_tac_toe.player_turn }.from(player_one).to(player_two)
    end

    it 'alternates player turn from player two to player one' do
      tic_tac_toe.instance_variable_set(:@players, [player_two, player_one])
      tic_tac_toe.instance_variable_set(:@player_turn, player_two)
      expect { tic_tac_toe.switch_player_turn }.to change { tic_tac_toe.player_turn }.from(player_two).to(player_one)
    end
  end

  describe '#winner?' do
    it 'has ended the game with player one winning row' do
      tic_tac_toe.board.instance_variable_set(:@tiles, ['x', 'x', 'x', nil, nil, nil, nil, nil, nil])
      tic_tac_toe.instance_variable_set(:@player_turn, player_one)
      expect(tic_tac_toe.winner?).to be_truthy
    end

    it 'has ended the game with player two winning column' do
      tic_tac_toe.board.instance_variable_set(:@tiles, [nil, nil, nil, 'o', 'o', 'o', nil, nil, nil])
      tic_tac_toe.instance_variable_set(:@player_turn, player_two)
      expect(tic_tac_toe.winner?).to be_truthy
    end

    it 'has ended the game with player one winning diagonally' do
      tic_tac_toe.board.instance_variable_set(:@tiles, ['x', nil, nil, nil, 'x', nil, nil, nil, 'x'])
      tic_tac_toe.instance_variable_set(:@player_turn, player_one)
      expect(tic_tac_toe.winner?).to be_truthy
    end

    it 'has not ended the game' do
      tic_tac_toe.instance_variable_set(:@player_turn, player_one)
      expect(tic_tac_toe.winner?).to be_falsey
    end
  end

  describe '#draw?' do
    it 'has ended in a draw' do
      tic_tac_toe.board.instance_variable_set(:@tiles, ['x','o','x','o','o','x','x','x','o'])
      tic_tac_toe.instance_variable_set(:@player_turn, player_one)
      expect(tic_tac_toe.draw?).to be_truthy
    end

    it 'has not ended in a draw' do
      expect(tic_tac_toe.draw?).to be_falsey
    end
  end

  describe '#request_move' do
    # yields the block once in the loop. Breaks the loop.
    before(:each) do
      allow(tic_tac_toe).to receive(:loop).and_yield  
    end

    it 'requests player for a move and it is valid' do
      tic_tac_toe.instance_variable_set(:@player_turn, player_one)
      allow(tic_tac_toe).to receive(:gets).and_return('0')
      expect { tic_tac_toe.request_move }.to output("Your move #{player_one.name}!\n").to_stdout
      expect(tic_tac_toe.request_move).to eq(0)
    end

    it 'requests player for a move and it is invalid' do
      tic_tac_toe.instance_variable_set(:@players, [player_two, player_one])
      tic_tac_toe.instance_variable_set(:@player_turn, player_two)
      allow(tic_tac_toe).to receive(:gets).and_return('10')
      expect { tic_tac_toe.request_move }.to output("Your move #{player_two.name}!\nNot a valid move!\n #{nil}  | #{nil}  | #{nil}  \n-----------\n #{nil}  | #{nil}  | #{nil}  \n-----------\n #{nil}  | #{nil}  | #{nil}  \n").to_stdout
    end
  end

  describe '#valid_move?' do
    it 'is a valid move' do
      expect(tic_tac_toe.send(:valid_move?, '0')).to be_truthy
    end

    it 'is not a valid move' do
      expect(tic_tac_toe.send(:valid_move?, '10')).to be_falsey
    end
  end
end