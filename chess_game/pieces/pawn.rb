class Pawn < Piece
    attr_reader :symbol
    def initialize(board, pos, color)
        @symbol = :P
        super
    end

    def moves
        forward_steps
    end

    private
    def at_start_row?
        if @color == :white
            self.pos[0] == 6
        elsif @color == :black
            self.pos[0] == 1
        end
    end

    def forward_dir
        if @color == :white
            -1
        elsif @color == :black
            1
        end
    end

    def forward_steps
        new_pos = [self.pos[0]+forward_dir, self.pos[1]]
        possible_spots_in_dir = [new_pos]
        
        if at_start_row? 
            possible_spots_in_dir << [new_pos[0]+forward_dir, new_pos[1]]
        end

        possible_spots_in_dir
    end

    def side_attacks

    end
end