#Author: Jennifer Alarcon
#Creation Date: 2/1/17

require_relative 'board'


#Author: Jenn Alarcon - 2/1/17
#Description:
# Team Member           Date           Changes
#  Jenn               2/1/17
#

def main
  board = Board.new()
  board.render_board
  board.displayCurrentHand
  selectedSet = userPickSet


end


#Author: Jenn Alarcon - 2/1/17
#Description: Prompts use to select cards for a set

def userPickSet
  print "\nEnter three card numbers to select as a set, seperated by a space: "
  selection = gets.chomp!

  until selection.length >= 5
    print "\nINAVLID INPUT\nPlease enter three card numbers seperated by a space: "
    selection = gets.chomp!
    userSet = selection.split
  end

  #checkIfValidSelection
  userSet
end



main
