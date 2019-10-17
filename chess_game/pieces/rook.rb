require_relative "modules/slideable.rb"

class Rook < Piece
    include Slideable
    attr_reader :symbol

    def initialize(board, pos, color)
        @symbol = :R
        super
    end

    protected
    def move_dirs
        orthogonal_dirs
    end
end