require_relative "piece.rb"
require_relative "custom_errors.rb"
require_relative "pieces/null_piece.rb"
require_relative "pieces/rook.rb"
require_relative "pieces/bishop.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/king.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/pawn.rb"
require_relative "display.rb"

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @grid.each_with_index do |row, i|
            row.each_with_index do |tile, j|
                if i > 1 && i < 6
                    self[[i,j]] = NullPiece.new

                elsif i == 1
                    self[[i,j]] = Pawn.new(self, [i,j], :black)
                elsif i == 6
                    self[[i,j]] = Pawn.new(self, [i,j], :white)

                elsif i == 0 && j == 0 || i == 0 && j == 7
                    self[[i,j]] = Rook.new(self, [i,j], :black)
                elsif i == 7 && j == 0 || i == 7 && j == 7
                    self[[i,j]] = Rook.new(self, [i,j], :white)

                elsif i == 0 && j == 1 || i == 0 && j == 6
                    self[[i,j]] = Knight.new(self,[i,j], :black)
                elsif i == 7 && j == 1 || i == 7 && j == 6
                    self[[i,j]] = Knight.new(self,[i,j], :white)

                elsif i == 0 && j == 2 || i == 0 && j == 5
                    self[[i,j]] = Bishop.new(self,[i,j], :black)
                elsif i == 7 && j == 2 || i == 7 && j == 5
                    self[[i,j]] = Bishop.new(self,[i,j], :white)

                elsif i == 0 && j == 3
                    self[[i,j]] = Queen.new(self, [i,j], :black)
                elsif i == 7 && j == 3
                    self[[i,j]] = Queen.new(self, [i,j], :white)

                elsif i == 0 && j == 4
                    self[[i,j]] = King.new(self, [i,j], :black)
                elsif i == 7 && j == 4
                    self[[i,j]] = King.new(self, [i,j], :white)
                end
            end
        end
    end

    def [](pos)
        row, column = pos
        @grid[row][column]
    end

    def []=(pos, value)
        row, column = pos
        @grid[row][column] = value
    end

    def valid_cursor_move?(pos)
        pos[0] < 7 || pos[0] > 0 || pos[1] < 7 || pos[1] > 0
    end

    def in_check?(color)
        king_pos = find_king(color)
        @grid.each do |row|
            row.each do |piece|
                if piece.moves.include?(king_pos) && piece.color != color
                    return true
                end
            end
        end
        false
    end

    def find_king(color)
        @grid.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                return [i,j] if piece.is_a?(King) && piece.color == color
            end
        end
    end

    def checkmate?(color)

    end

    def move_piece(start_pos, end_pos)
        if start_pos.is_a?(NullPiece)
            raise NoPieceError
        elsif valid_pos?(end_pos) == false 
            raise InvalidMoveError
        else
            @grid[end_pos] = @grid[start_pos]
            @grid[start_pos] = NullPiece.new
        end
    end
end

