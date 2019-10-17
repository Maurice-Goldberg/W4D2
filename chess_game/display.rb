require "colorize"
require_relative "cursor.rb"

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        render_grid = Array.new(8)
        @board.grid.each_with_index do |row, i|
            render_grid[i] = row.map.with_index do |piece, j|
                if @cursor.cursor_pos == [i,j]
                    background = :red
                else  
                    background = nil
                end

                if piece.color == :white
                    piece.to_s.colorize(color: :white, background: background)
                elsif piece.color == :black
                    piece.to_s.colorize(color: :blue, background: background)
                elsif piece.is_a?(NullPiece)
                    piece.to_s.colorize(background: background)
                end
            end
            puts render_grid[i].join(" ")
        end
    end
end