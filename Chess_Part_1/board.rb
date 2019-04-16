require "byebug"
require "singleton"
require_relative 'piece'
require_relative 'nullpiece'

class Board 
    def initialize
        @sentinel = NullPiece.instance
        @rows = Array.new(8) { Array.new(8, @sentinel) } 

        @rows[0][0] = Piece.new(:b, self, [0,0]) #"BLACK-ROOK"
        @rows[0][1] = Piece.new(:b, self, [0,1]) #"BLCK-KNGHT"
        @rows[0][2] = Piece.new(:b, self, [0,2]) #"BLACK-BSHP"
        @rows[0][3] = Piece.new(:b, self, [0,3]) #"BLCK-QUEEN"
        @rows[0][4] = Piece.new(:b, self, [0,4]) #"BLACK-KING"
        @rows[0][5] = Piece.new(:b, self, [0,5]) #"BLACK-BSHP"
        @rows[0][6] = Piece.new(:b, self, [0,6]) #"BLCK-KNGHT"
        @rows[0][7] = Piece.new(:b, self, [0,7]) #"BLACK-ROOK" 
        (0...8).each do |i|
            @rows[1][i] = Piece.new(:b, self, [1,i]) #"BLACK-PAWN"
        end

        (0...8).each do |i|
            @rows[6][i] = Piece.new(:w, self, [6,i]) #"WHITE-PAWN"
        end
        @rows[7][0] = Piece.new(:w, self, [7,0]) #"WHITE-ROOK"
        @rows[7][1] = Piece.new(:w, self, [7,1]) #"WHTE-KNGHT"
        @rows[7][2] = Piece.new(:w, self, [7,2]) #"WHITE-BSHP"
        @rows[7][3] = Piece.new(:w, self, [7,3]) #"WHTE-QUEEN"
        @rows[7][4] = Piece.new(:w, self, [7,4]) #"WHITE-KING"
        @rows[7][5] = Piece.new(:w, self, [7,5]) #"WHITE-BSHP"
        @rows[7][6] = Piece.new(:w, self, [7,6]) #"WHTE-KNGHT"
        @rows[7][7] = Piece.new(:w, self, [7,7]) #"WHITE-ROOK"
    end 

    def move_piece(start_pos, end_pos) 
        raise 'There is no piece here.' if self[start_pos].is_a?(NullPiece)
        # debugger
        raise 'There is already a piece here.' unless self[end_pos].is_a?(NullPiece)

        self[end_pos] = self[start_pos]
        self[start_pos] = @sentinel
    end 

    def [](pos)
        i, j = pos
        @rows[i][j]
    end

    def []=(pos, val)
        i, j = pos
        @rows[i][j] = val 
    end

    def test_print 
        @rows.map do |row| 
            row.map do |ele| 
                if ele.is_a?(NullPiece) 
                    nil 
                else
                    :x
                end 
            
            end 
        end 
    end 

    def valid_pos?(pos)
        i, j = pos 
        (0..7).include?(i) && (0..7).include?(j) 
    end 

end 






