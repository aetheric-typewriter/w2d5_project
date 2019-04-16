require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display 
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        data_in = @cursor.get_input

        print_val = Array.new(8) { Array.new(8) }
        
        for i in 0...8
            for j in 0...8
                ele = @board[[i, j]]
                str = ele.is_a?(NullPiece) ? '_' : 'X'
                if @cursor.cursor_pos == [i,j]
                    print_val[i][j] = str.colorize(:background => :green)
                else
                    print_val[i][j] = str.colorize(:background => :white, :color => :red)
                end 
            end
        end

        print_val.each do |row|
            row.each do |el|
                print el
            end
            print "\n"
        end

        # system "clear"

        print "\n\n\n"
    end
end 

# load 'cursor.rb' 
# load 'board.rb' 
# load 'display.rb' 
# load 'nullpiece.rb' 
# load 'piece.rb'

# b1 = Board.new
# x = Display.new(b1)
# x.render

b1 = Board.new
x = Display.new(b1)
while true
    x.render
end
