require_relative 'slideable'
require_relative 'steppable'

class Piece 
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color 
        @board = board 
        @pos = pos
    end 

    def moves 
    end 

    



end 