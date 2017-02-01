#Author: Jennifer Alarcon
#Creation Date: 2/1/17

require_relative 'board'


#Author: Jenn Alarconr - 2/1/17
#Description:
# Team Member           Date           Changes
#  Jenn               2/1/17          
#

def main
  board = Board.new()
  board.render_board
  board.displayCurrentHand
end

main
