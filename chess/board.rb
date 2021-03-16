require_relative "piece"
require_relative "nullpiece"
require "byebug"

class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @grid.each_with_index do |row, idx|
            if idx == 0 || idx == 1
                row.map! do |pos|
                    p ||= Piece.new 
                    p
                end
            elsif idx == 6 || idx == 7
                row.map! do |pos|
                    p ||= Piece.new 
                    p
                end
            else
                row.map! do |pos|
                    n ||= NullPiece.new 
                    n
                end
            end
        end
    end

    def [](pos) 
        row = pos[0] 
        col = pos[1] 
        @grid[row][col] 
    end

    def []=(pos, val)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "Error" unless self[start_pos].is_a?(Piece)
        # raise "Error" unless valid_move?(end_pos)

        current_piece = self[start_pos]
        other_piece = self[end_pos]
        # debugger
        if other_piece.is_a?(NullPiece)
            self[start_pos], self[end_pos] = other_piece, current_piece
        else
            self[start_pos] = NullPiece.new
            self[end_pos] = current_piece
        end 
    end

end

# [
#     [0, 1, 2, 3, 4, 5, 6, 7], 0
#     [0, 1, 2, 3, 4, 5, 6, 7], 1
#     [0, 1, 2, 3, 4, 5, 6, 7], 2
#     [0, 1, 2, 3, 4, 5, 6, 7], 3
#     [0, 1, 2, 3, 4, 5, 6, 7], 4
#     [0, 1, 2, 3, 4, 5, 6, 7], 5
#     [0, 1, 2, 3, 4, 5, 6, 7], 6
#     [0, 1, 2, 3, 4, 5, 6, 7]  7
# ]

