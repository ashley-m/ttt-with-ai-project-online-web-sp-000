class Game

  attr_accessor :board, :player_1, :player_2, :turn

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O") , b = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = b
  end

  def display_board
    puts " #{@board.cells[0]} | #{@board.cells[1]} | #{@board.cells[2]} "
    puts "-----------"
    puts " #{@board.cells[3]} | #{@board.cells[4]} | #{@board.cells[5]} "
    puts "-----------"
    puts " #{@board.cells[6]} | #{@board.cells[7]} | #{@board.cells[8]} "
  end

  def current_player
    if @board.cells.count{|x| x!= " "} % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |wins|
      if((wins.all? do |space| @board.cells[space]=="X" end)||(wins.all? do |space| @board.cells[space]=="O" end))
        return wins
      end
    end
  end

  def full?
    @board.cells.all? do |space| space=="X"||space=="O" end
  end

  def draw?
    full?&&!won?
  end

  def over?
    draw?||won?
  end

  def winner
    if !won?
      return nil
    else
      return @board.cells[won?[0]]
    end
  end

  def turn
    pos = current_player.move(@board)
    if @board.valid_move?(pos)
      @board.cells[@board.to_ind(pos)] = current_player.token
    else
      puts "Invalid move"
      display_board
      turn
    end
    display_board
  end

  def play
    display_board
    while (!over?)
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
    puts "Congratulations #{winner}!"
    end
  end

end
