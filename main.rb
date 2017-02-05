#Author: Jennifer Alarcon, Raphael Huang
#Creation Date: 2/1/17

require_relative 'board'

#Author: Jenn Alarconr - 2/1/17
#Description:
# Team Member           Date           Changes

#  Jenn               2/1/17
#
#

def display
  board = Board.new()
  board.displayCurrentHand
end

#Author: Raphael Huang, Jenn Alarcon- 2/2/17
#Description: play the game
# Team Member           Date           Changes
# Jenn                  2/3/17          Split up code in methods, changed score initlizaiton messages

def play_the_game
  player_scores = initialize_scores_for_players
  puts "You have selected #{player_scores.length} player(s). Let's play!"

  #INITALLY BOARD HAS ARRAY OF 12 CARDS
  board = Board.new()
  board.displayCurrentHand


  selection = selection_prompt

  noSetsPossible = false
  until selection.casecmp("exit") == 0 || board.board_size <= 3 || noSetsPossible

    #Need to validate set format if not, reprompt
    #if selection is valid
    if selection.casecmp('A') == 0
      board.add_cards
    else
        set = selection.split
        #Correctly idenetified set?
        if board.is_set?(set)
          puts "You found a set! :-)"
          board.remove_cards_at(set)
          #identify_player
          update_score(player_scores)
          #board.add_cards
        else
          puts "The set you selected is not valid. :( Please try again."
          selection = selection_prompt
          #Need to validate set format if not, reprompt(write another method?)
        end

      end
      #Refresh Terminal
      system('clear')
      board.displayCurrentHand
      displayScore(player_scores)
      selection = selection_prompt
    #end until
    end
    system('clear')
    #End game
    puts "\nThanks for playing! Here are the final score(s): "
    displayScore(player_scores)

end

#Author: Jenn Alarcon - 2/3/17
#Description: Displays player scores
def displayScore(scores)
  puts "\n\n             SCORES              "
  puts "---------------------------------"
  scores.length().times {|i| puts "|\tPlayer #{i+1} score: #{scores[i]}\t|"}
  puts "---------------------------------\n\n"
end


#Author: Jenn Alarcon - 2/3/17
#Description: updates player score
def update_score(scores)
  player = 1;
  #only ask which player if more than one player
  if scores.length > 1
    puts "Which player found the set?"
    player = gets.chomp!.to_i
  end
  scores[player-1] += 1
end

#Author: Jenn Alarcon - 2/3/17
#Description: Returns if the selected cards are in the right format
def set_seleciton_valid?(selection)
  return selection.length > 0
end

#Author: Jenn Alarcon - 2/3/17
def initialize_scores_for_players
  puts "Enter the number of players: "
  numPlayers = gets.chomp!
  until numPlayers != 0
    puts "Invalid entry. Enter the number of players: "
    numPlayers = gets.chomp!
  end
  #initilizes all scores for each player to 0
  scores = Array.new(numPlayers.to_i,0)
end

#Author: Jenn Alarcon - 2/3/17
def selection_prompt

  puts "_____________________________________________________________________"
  puts "GAME COMMANDS\n"
  puts "EXIT: to end the game "
  puts "'A' : to adds three more cards"
  puts "\nOr just enter the card numbers you want to select as a set each followed by a space."
  puts "\n\tExample:  \n\tCard 1, Card 2, and Card 12 would be entered as followed: 1 2 12."
    puts "_____________________________________________________________________"
  print "YOUR SELECTION: "
  gets.chomp!
end


#STARTING THE GAME -- IT"S GONNA GET REAL FAM
play_the_game
