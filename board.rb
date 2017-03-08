require_relative "tile"
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = Board.make_grid
    populate
  end

  def self.make_grid
    Array.new(9) { Array.new(9) }
  end

  def place_tiles
    grid.each_with_index do |row, row_num|
      row.each_with_index do |box, col_num|
        self[[row_num,col_num]] = Tile.new([row_num, col_num], false, self) if box.nil?
      end
    end
  end

  def place_bombs(num_bombs)
    num_bombs.times do
      rand_pos = [rand(8), rand(8)]
      rand_pos = [rand(8), rand(8)] until self[rand_pos].nil?

      self[rand_pos] = Tile.new(rand_pos, true, self)
    end
  end

  def populate(num_bombs = 10)
    place_bombs(num_bombs)
    place_tiles
  end

  def render
    puts "  0 1 2 3 4 5 6 7 8"
    grid.each_with_index do |row, i|
      print "#{i}|"
      row.each do |tile|
        if tile.revealed?
          print "#{tile.value}|"
        else
          print " |"
        end
      end
      puts
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, mark)
    x, y = pos
    @grid[x][y] = mark
  end

  def in_grid?(pos)
    pos[0].between?(0,9) && pos[0].between?(0,9)
  end
end
