require 'pry'

class Board
  attr_reader :tiles

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def initialize
    @tiles = Array.new(9)
  end

  def place(player, position)
    return 'Not an empty tile' unless @tiles[position].nil?
    @tiles[position] = player.mark.type
  end

  def winner?(player)
    combination = WIN_COMBINATIONS.find do |indices|
      values = @tiles.values_at(*indices)
      values.all?(player.mark.type)
    end

    player unless combination.nil?
  end

  private

  attr_writer :tiles
  
end