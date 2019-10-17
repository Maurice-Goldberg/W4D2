require_relative "display.rb"
require_relative "board.rb"

class Game
    def initialize(board, display, players, current_player)
        @board = board 
        @display = display
        @players = players
        @current_player = current_player
    end

end

if __FILE__ == $PROGRAM_NAME
    players, current_player = [], [] #placeholder to not throw error

    board = Board.new
    display = Display.new(board)
    game = Game.new(board, display, players, current_player)
    while true
        display.render
        display.cursor.get_input
        system("clear")
    end
end