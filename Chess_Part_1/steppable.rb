module Steppable
  
    KING_DELTAS = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [1,-1], [-1,1], [-1,-1]]
    KNIGHT_DELTAS = [[2,1], [2,-1], [1,2], [1,-2], [-1,2], [-1,-2], [-2,1], [-2,-1]]
 
    def moves 
        if self.is_a?(King)
            current_pos = self.pos
            next_pos = KING_DELTAS.map do |ele|  
                [ele[0] + current_pos[0], ele[1] + current_pos[1]]
            end 

            board = self.board
            
            next_pos = next_pos.select { |el| board.valid_pos?(el) }
            next_pos.select { |el| board[el].color != self.color }

        elsif self.is_a?(Knight)
            current_pos = self.pos
            next_pos = KNIGHT_DELTAS.map do |ele|  
                [ele[0] + current_pos[0], ele[1] + current_pos[1]]
            end 

            board = self.board
            
            next_pos.select { |el| board.valid_pos?(el) }
            next_pos.select { |el| board[el].color != self.color }

        end 
    end

    private

    def move_diffs(deltas)
        # deltas.each add delta to current pos check if its valid
    end

end