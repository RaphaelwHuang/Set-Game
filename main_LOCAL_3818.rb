#Author: Jennifer Alarcon, Raphael Huang
#Creation Date: 2/1/17

require_relative 'board'

#Author: Jenn Alarconr - 2/1/17
#Description:

#Author: Raphael Huang, Jenn Alarcon- 2/2/17
#Description: play the game
# Team Member           Date           Changes
# Tony Su               2/5/17         change line 45,46,48
# Tony Su               2/5/17         change line 65

def play_the_game
  player_scores = initialize_scores_for_players
  puts "You have selected #{player_scores.length} player(s). Let's play!"

  #INITALLY BOARD HAS ARRAY OF 12 CARDS
  board = Board.new()
  board.displayCurrentHand


  #Game Prompt
  selection = selection_prompt
  endOfGame = false
  total_cards_dealt = 12
  until selection.casecmp("exit") == 0 || endOfGame

    setWasFound = false;
    validEntry = true;
    printSetErrorMessage1 = false;
    setErrorMessgae = []

    if selection.casecmp('A') == 0
      board.add_cards
      total_cards_dealt += 3 unless total_cards_dealt == 81

    else
        set = selection.split
        validEntry = check_valid_input_set(set, board, setErrorMessgae)
        printSetErrorMessage = true;

        if validEntry
          selectCards = board.cards_at(set)
          #if valid check if it actually a set
          if Board.actual_set?(selectCards)
            setWasFound = true;
            board.remove_cards_at(set)
            #identify_player
            update_score(player_scores)
            board.add_cards unless total_cards_dealt == 81
          else
            puts "The set you selected is not valid. :( Please try again."
            validEntry = false
          end
        end

      end

        system('clear')
        board.displayCurrentHand
        displayScore(player_scores) unless !validEntry
        puts "Yay! A set was found! :-)" unless !setWasFound || !validEntry

        puts "\n\t🔺 NOT A VALID ENTRY. PLEASE TRY AGAIN.🔺\n" unless validEntry
        puts "\n\t #{setErrorMessgae[0]}" unless !printSetErrorMessage

      selection = selection_prompt #unless !game_over?(total_cards_dealt,board)

    end
    system('clear')
    #End game
    puts "\nThanks for playing! Here are the final score(s): "
    displayScore(player_scores)

end




# Method Author: Jenn Alarcon- 2/5/17
# Description: Check if game is at an end
# Team Member           Date           Changes
#
def game_over?(total_cards_dealt, board)
  return total_cards_dealt == 81 && !board.does_set_exist
end



#Author: Jenn Alarcon - 2/5/17
#Description: check if selected cards is a valid input
def check_valid_input_set(set, board, setErrorMessgae)
  if set.length != 3

    setErrorMessgae.push "\nInvalid selection. Please only enter three cards when choosing a set. \n"
    return false
  else
    set.each do |card|
      card = card.to_i
      if !(card.between?(1, board.board_size))
        setErrorMessgae.push "\nYou selected a card that is not on the board. Please try again!"
        return false
      end
    end
  end
    return true;
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
