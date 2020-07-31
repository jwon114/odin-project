class Board
  attr_reader :tiles

  def initialize
    @tiles = Array.new(9)
  end

  def render
    printf " %1s | %1s | %1s \n", tiles[0], tiles[1], tiles[2]
    puts "-----------"
    printf " %1s | %1s | %1s \n", tiles[3], tiles[4], tiles[5]
    puts "-----------"
    printf " %1s | %1s | %1s \n", tiles[6], tiles[7], tiles[8]
  end

  def place_mark(position, mark)
    return 'Not an empty tile' unless valid_placement?(position)
    tiles[position] = mark
  end

  def valid_placement?(position)
    tiles[position].nil?
  end

  private

  attr_writer :tiles

end