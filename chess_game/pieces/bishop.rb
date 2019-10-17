class Bishop < Piece
    include Slideable
    attr_reader :symbol

    def initialize(board, pos, color)
        @symbol = :B
        super
    end

    protected
    def move_dirs
        diagonal_dirs
    end
end