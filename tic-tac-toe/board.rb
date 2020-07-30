class Board
  attr_reader :tiles

  def initialize
    @tiles = Array.new(9)
  end

  def render
    puts " #{@tiles[0]} | #{@tiles[1]} | #{@tiles[2]} "
    puts "--------"
    puts " #{@tiles[3]} | #{@tiles[4]} | #{@tiles[5]} "
    puts "--------"
    puts " #{@tiles[6]} | #{@tiles[7]} | #{@tiles[8]} "
  end

  def place_mark(position, mark)
    return 'Not an empty tile' unless valid_placement?(position)
    @tiles[position] = mark
  end

  def valid_placement?(position)
    @tiles[position].nil?
  end
end