require_relative "board"
require 'byebug'

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
            next_pos.select { |el| board[el].color != self.color }

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
            next_pos.select { |el| board[el].color != self.color }

        
        elsif self.is_a?(Bishop)
            current_pos = self.pos
            
            start_deltas = DIAGONAL_DIRS
            bishop_deltas = []
            (1...8).each do |i|
                bishop_deltas += start_deltas.map {|vector| [vector[0] * i, vector[1] * i]}
            end

            board = self.board
            
            next_pos.select { |el| board.valid_pos?(el) }
            next_pos.select { |el| board[el].color != self.color }

        end

    end 


    private 


    def move_dirs
        
    end 


    def grow_unblocked_moves_in_dir(dx, dy) 
        start_pos = self.pos 
        board = self.board
        myself = self 
        arr = [] 
        continue = true 
        i = 1
        while continue 
            last_pos = (arr.empty? ? start_pos : arr[-1])
            next_pos = [last_pos[0] + dx*i, last_pos[1] + dy*i]

            blocked_by_other = (!board[next_pos].is_a?(NullPiece)) && (myself.color != board[next_pos].color)
            blocked_by_same = (!board[next_pos].is_a?(NullPiece)) && (myself.color == board[next_pos].color)
            off_board = board.valid_pos?(next_pos)
            not_blocked = ! ( blocked_by_other || blocked_by_same || off_board )

            if not_blocked 
                arr << next_pos
                i += 1 
                continue = false 
            elsif blocked_by_other 
                arr << next_pos
                i += 1
                continue = false 
            elsif blocked_by_same 
                continue = false 
            elsif off_board 
                continue = false 
            end 
        end 
        return arr 
    end 
end 

if __FILE__ == $PROGRAM_NAME
    board1 = Board.new
    piece13 = board1[[1, 3]]
    piece13_start = piece13.pos
end

def grow_unblocked_moves_in_dir(dx, dy, start_pos, board, myself) 
    debugger

    arr = [] 
    continue = true 
    i = 1
    while continue 
        last_pos = (arr.empty? ? start_pos : arr[-1])
        next_pos = [last_pos[0] + dx*i, last_pos[1] + dy*i]

        blocked_by_other = (!board[next_pos].is_a?(NullPiece)) && (myself.color != board[next_pos].color)
        blocked_by_same = (!board[next_pos].is_a?(NullPiece)) && (myself.color == board[next_pos].color)
        off_board = board.valid_pos?(next_pos)
        not_blocked = ! ( blocked_by_other || blocked_by_same || off_board )

        if not_blocked 
            arr << next_pos
            i += 1 
            continue = false 
        elsif blocked_by_other 
            arr << next_pos
            i += 1
            continue = false 
        elsif blocked_by_same 
            continue = false 
        elsif off_board 
            continue = false 
        end 
    end 
    return arr 
end 