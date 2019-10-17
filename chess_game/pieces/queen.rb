class Queen < Piece
    include Slideable
    attr_reader :symbol

    def initialize(board, pos, color)
        @symbol = :Q
        super
    end

    protected
    def move_dirs
        orthogonal_dirs + diagonal_dirs
    end
end