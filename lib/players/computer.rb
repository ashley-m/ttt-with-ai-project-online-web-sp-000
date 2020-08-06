module Players
  class Computer < Player
    attr_reader :board, :game

    def initialize(tok)
      super(tok)
      @game = Game.new
      @board = game.board
    end

    def move(board)
      i = 5
      first = 0
      board.cells.each {|x|
        if x == " " # returns next move 
          return i.to_s
        else
          if x!=9
            i += 2
          else
            first = 1
            x = 1
          end
        end
      }
    end

  end

end
