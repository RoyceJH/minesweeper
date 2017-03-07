class Tile
  attr_reader :value, :num_adj_bombs, :grid

  def initialize(bomb, grid)
    @bomb = bomb
    @grid = grid
    @revealed = false
    @flag = false
    @value = 1
  end

  def revealed?
    @revelaed == true
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



#asdfsdf
