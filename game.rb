require_relative 'board'
require 'byebug'

class Game
  attr_accessor :board, :game_over

  def initialize
    @board = Board.new
    @game_over = false
  end

  def render_board
    @board.render
  end

  def player_input
    input = gets.chomp
    input.split(",").map! { |cord| cord.to_i }
  end

  def play
    until game_over?
      # system("clear")
      render_board
      prompt
      input = p player_input
      reveal(input)

    end
  end

  def reveal(pos)
    @board[pos].reveal
    p @board[pos].revealed
  end

  def game_over?
    @game_over == true
  end


  def prompt
    puts "Select a square, then enter 'r' to reveal or 'f' to flag"
  end

end

g = Game.new
g.play
