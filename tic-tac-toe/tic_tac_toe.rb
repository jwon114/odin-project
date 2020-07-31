require './board'
require './player'
require 'pry'

class TicTacToe
  attr_reader :board, :players, :player_turn

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def initialize
    @board = Board.new
    @players = []
    @player_turn = nil
  end

  def add_player(name)
    type = players.empty? ? 'x' : 'o'
    new_player = Player.new(name, type)
    self.players << new_player
    self.player_turn = new_player if type == 'x'
  end

  def play
    puts "Welcome to TicTacToe"
    puts "Numbers 0-8 represent each square starting from top left to bottom right"
    
    puts 'Player one name: '
    name = gets.chomp
    add_player(name)

    puts 'Player two name: '
    name = gets.chomp
    add_player(name)

    loop do
      board.render
      position = request_move
      board.place_mark(position, player_turn.mark)
      
      if winner?
        board.render
        puts "#{player_turn.name} wins!"
        break
      end

      if draw?
        board.render
        puts "It's a draw!"
        break
      end

      switch_player_turn
    end
  end

  def switch_player_turn
    self.players.rotate!
    self.player_turn = self.players.first
  end

  def winner?
    WIN_COMBINATIONS.find do |indices|
      values = board.tiles.values_at(*indices)
      values.all?(player_turn.mark)
    end
  end

  def draw?
    board.tiles.count(nil).zero?
  end

  def request_move
    loop do
      puts "Your move #{player_turn.name}!"
      move = gets.chomp
      if valid_move?(move)
        return move.to_i
      else
        puts "Not a valid move!"
        board.render
      end
    end
  end

  private

  attr_writer :players, :player_turn

  def valid_move?(move)
    move.to_i.between?(0, 8) && @board.valid_placement?(move.to_i)
  end
end