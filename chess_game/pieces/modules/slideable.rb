require "byebug"

module Slideable
    
    # Classes that include Slideable in particular need the Board so they know to stop
    # sliding when blocked by another piece. Don't allow a piece to move into a square already
    #occupied by the same color piece, or to move a sliding piece past a piece that blocks it.

    ORTHOGONAL_DIRS = [[-1, 0], [1,0], [0,-1], [0,1]] #up, down, left, right
    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,-1], [-1,1]]

    def orthogonal_dirs 
        ORTHOGONAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        possible_spots = []
        move_dirs_arr = self.move_dirs
        move_dirs_arr.each do |dir|
           possible_spots += grow_move_until_blocked(dir[0], dir[1])
        end

        possible_spots
    end

    private
    def move_dirs #placeholder (duck typing). Move_dirs is actually delegated to the more specific subclass.
        #this will get completely overwritten
    end

    def grow_move_until_blocked(dx, dy)
        possible_spots_in_dir = []
        pos_var = self.pos.dup
        pos_var[0] += dx
        pos_var[1] += dy

        until out_of_bounds?(pos_var) || !@board[pos_var].is_a?(NullPiece)
            possible_spots_in_dir.push(pos_var.dup)
            pos_var[0] += dx
            pos_var[1] += dy
        end

        possible_spots_in_dir
    end
end