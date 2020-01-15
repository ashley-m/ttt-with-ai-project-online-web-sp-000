module Players
  class Computer < Player
    attr_reader :board, :game

    def initialize(tok)
      super(tok)
      #@game = game
      #@board = game.board
    end

    def move(board)
      i = 1
      board.cells.each {|x|
        if x == " " # returns next move 
          return i.to_s
        else
          i+=1
        end
      }
    end
    
    def getNextMove(board, p, depth)
      {
        # find available spaces (if theres a winner return the depth(computer)/-depth(player)/0(tie))
        # 
        # for each available space set to current player
        # call getnextmove with new board, next player, depth++
        #
      }

  end

  class GameTree
    def sim(player, board, game, depth = 0)
      valid_moves(board).each{|x|
      depth +=1
    }
    end

    def valid_moves(board)
      empty = []
      board.cells.each_with_index{|x, y|
        if x == " "
          empty << y+1
        end
      }
      empty
    end
  end
end
