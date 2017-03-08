class Tile
  attr_accessor :value, :num_adj_bombs, :revealed
  attr_reader :board, :pos

  def initialize(pos, bomb, board)
    @pos = pos
    @bomb = bomb
    @board = board
    @revealed = false
    @flag = false
    @num_adj_bombs = 0
  end

  def revealed?
    @revealed == true
  end

  def flag?
    @flag == true
  end

  def bomb?
    @bomb == true
  end

  def reveal
    @revealed = true
  end

  def neighbors
    num_adj_bombs = 0
    num_adj_bombs += 1 if up.bomb?
    num_adj_bombs += 1 if down.bomb?
    num_adj_bombs += 1 if left.bomb?
    num_adj_bombs += 1 if right.bomb?
    @value = num_adj_bombs
  end

  def up
    check_pos = [pos[0] + -1, pos[1]]
    board[pos] if board.in_grid?(pos)
  end

  def down
    check_pos = [pos[0] + +1, pos[1]]
    board[pos] if board.in_grid?(pos)
  end

  def left
    check_pos = [pos[0], pos[1] - 1]
    board[pos] if board.in_grid?(pos)
  end

  def right
    check_pos = [pos[0], pos[1] + 1]
    board[pos] if board.in_grid?(pos)
  end


end
