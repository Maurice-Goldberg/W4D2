require "byebug"
module Steppable
    def moves
        possible_spots = []
        move_diffs_arr = self.move_diffs
        move_diffs_arr.each do |diff|
            y = self.pos[0] + diff[0]
            x = self.pos[1] + diff[1]
            if !out_of_bounds?([y,x]) && @board[[y,x]].is_a?(NullPiece)
                possible_spots << [y,x]
            end
        end

        possible_spots
    end

    private
    def move_diffs #duck typing

    end
end