#Author: Raphael Huang
#Creation Date: 2/5/17

require_relative 'board'

class ComputerPlayer

#Author: Raphael Huang
#Description: create an AI computer

def createComputer
  puts"\n\n*******************************************************\n"
  puts"Hi! I am an AI computer, I also can play the game of seta. I can show you how amazing I am!!\n"

  sleep 1
  puts"\nCan I try the game?"
  puts"If you want me to join the game, please enter yes! If you want to end the game you can type anything you want:"
  answer = gets.chomp!
  if answer != "yes"
    puts"Thank you and have fun!\n\n"
  end
  answer
end


# Method Author: Jenn Alarcon- 2/5/17
# Description: Check if game is at an end
def game_over?(total_cards, board)
  return total_cards == 81 && board.board_size < 12
end


#Author: Raphael Huang
#Desccription: AI computer is playing the game

def letsPlay
  #Initially, there is 12 cards
  board = Board.new()
  total_cards = 12

  #Initial the score
  score = 0

  game_over = game_over?(total_cards, board)
  until game_over
    #Find the set
    set = board.does_set_exist
    check = Board.actual_set?(set)
    puts"Check: My answer is #{check}"
    if check
      board.remove_cards_forAI(set[0], set[1], set[2])
      if total_cards < 81 && board.board_size < 12
	board.add_cards
	total_cards += 3
	score += 1
      end
    else
      puts"***There is no set in the board, I have to add 3 cards.***" 
      board.add_cards
      total_cards += 3
    end 
    game_over = game_over?(total_cards, board)
  end

  puts"\n***The Result***"
  puts"My final score is: " + score.to_s 
end


#Author: Raphael Huang
#Desccription: AI computer's main method

def main
  #Check the createComputer
  if createComputer == "yes"  
    
    #Show the time at the beginning
    timeIn = Time.now
    puts"\n***Start the Game***"
    puts"The time I beign to play is " + timeIn.to_s

    #Play the Gme, the computer find the set
    puts"\n***Find the Set***"
    letsPlay

    #Show the time in the end 
    timeOut = Time.now
    puts"The time I finish the play is " + timeOut.to_s
    puts"I just used: #{timeOut - timeIn} seconds to finsih the game.\n\n"
  end
end

end
