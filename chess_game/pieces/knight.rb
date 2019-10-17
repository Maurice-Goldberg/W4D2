class Knight < Piece
    include Steppable
    attr_reader :symbol

    def initialize(board, pos, color)
        @symbol = :N
        super
    end

    protected
    def move_diffs
        [[2,1], [2,-1], [-2,1], [-2, -1], [1,-2], [1,2], [-1,2], [-1,-2]]
    end
end