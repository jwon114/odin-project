require './board'
require './player'
require './mark'

class TicTacToe
  attr_reader :board, :players
  
  def initialize
    @board = Board.new
    @players = []
  end

  def add_player(name)
    type = @players.empty? ? 'x' : 'o'
    mark = Mark.new(type)
    @players << Player.new(name, mark)
  end
end