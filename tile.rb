class Tile
  attr_reader :value, :num_adj_bombs, :grid, :revealed

  def initialize(bomb, grid)
    @bomb = bomb
    @grid = grid
    @revealed = false
    @flag = false
    @value = num_adj_bombs
  end

  def reveal
    @revealed = true
  end

  def flag?
    @flag == true
  end

  def bomb?
    @bomb == true
  end


end
