module Slideable 
    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

    def horiontal_dirs 
        HORIZONTAL_DIRS 
    end

    def diagonal_dirs 
        DIAGONAL_DIRS 
    end 

    def moves
        if self.is_a?(Queen)
            current_pos = self.pos

            start_deltas = HORIZONTAL_DIRS + DIAGONAL_DIRS
            queen_deltas = []
            (1...8).each do |i|
                queen_deltas += start_deltas.map {|vector| [vector[0] * i, vector[1] * i]}
            end

            next_pos = queen_deltas.map do |ele|  
                [ele[0] + current_pos[0], ele[1] + current_pos[1]]
            end 

            board = self.board
            
            next_pos.select { |el| board.valid_pos?(el) }
        elsif self.is_a?(Rook)
            current_pos = self.pos

            start_deltas = HORIZONTAL_DIRS
            rook_deltas = []
            (1...8).each do |i|
                rook_deltas += start_deltas.map {|vector| [vector[0] * i, vector[1] * i]}
            end

            next_pos = rook_deltas.map do |ele|  
                [ele[0] + current_pos[0], ele[1] + current_pos[1]]
            end 

            board = self.board
            
            next_pos.select { |el| board.valid_pos?(el) }
        
        elsif self.is_a?(Bishop)
            current_pos = self.pos
            
            start_deltas = DIAGONAL_DIRS
            bishop_deltas = []
            (1...8).each do |i|
                bishop_deltas += start_deltas.map {|vector| [vector[0] * i, vector[1] * i]}
            end

            board = self.board
            
            next_pos.select { |el| board.valid_pos?(el) }
        end

    end 


    private 


    def move_dirs
        
    end 


    def grow_unblocked_moves_in_dir(dx, dy) 

    end 

end 