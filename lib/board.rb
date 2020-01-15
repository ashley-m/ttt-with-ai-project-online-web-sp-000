class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def full?
    @cells.all? {|x|
    x != " "
    }
  end

  def turn_count
    @cells.count {|x|
    x != " "
    }
  end

  def to_ind(pos)
    return pos.to_i - 1
  end

  def taken?(pos)
    ind = to_ind(pos)
    return @cells[ind] == "X" || @cells[ind] == "O"
  end

  def valid_move?(pos)
    ind = to_ind(pos)
    return (ind <= 8 && ind >= 0) && !taken?(pos)
  end

  def update(pos, letter)
    ind = to_ind(pos)
    @cells[ind] = letter.token
  end


end
