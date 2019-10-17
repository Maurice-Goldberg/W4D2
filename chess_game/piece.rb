class Piece
    attr_reader :pos, :color
    attr_writer :pos

    def initialize(board, pos, color)
        @board = board
        @pos = pos
        @color = color
    end

    def to_s
        self.symbol.to_s
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        move_dirs
    end

    def symbol

    end

    private 
    def move_into_check?(end_pos)

    end

    def out_of_bounds?(pos)
        pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
    end
end