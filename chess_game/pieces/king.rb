require_relative "modules/steppable.rb"

class King < Piece
    include Steppable
    attr_reader :symbol

    def initialize(board, pos, color)
        @symbol = :K
        super
    end

    protected
    def move_diffs
        [[1,0], [0,1], [1,1], [-1, 0], [0,-1], [-1,-1], [-1,1], [1,-1]]
    end
end

