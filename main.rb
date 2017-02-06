#Author: Jennifer Alarcon, Raphael Huang
#Creation Date: 2/1/17

require_relative 'board'

#Author: Raphael Huang, Jenn Alarcon- 2/2/17
#Description: play the game
# Team Member           Date           Changes
# Tony Su               2/5/17         change line 45,47
# Tony Su               2/5/17         change line 65
# Raphael Huang         2/6/17         add line about timer from line 19
def play_the_game
  player_scores = initialize_scores_for_players
  puts "You have selected #{player_scores.length} player(s). Let's play!"
  
  #Show the time at the beginning
  timeIn = Time.now
  puts"The time right now is " + timeIn.to_s

  #INITALLY BOARD HAS ARRAY OF 12 CARDS
  board = Board.new()
  board.displayCurrentHand


  #Game Prompt
  selection = selection_prompt(false)

  total_cards_dealt = 12
  game_over = game_over?(total_cards_dealt, board)
  until selection.casecmp("exit") == 0 || game_over

    #To check for valid input from player
    setWasFound = false;
    validEntry = true;
    setErrorMessage = []
    allCardsDealt = total_cards_dealt == 81
    addedCards = false


    #Only add cards if there are still cards to deal
    if selection.casecmp('A') == 0 && !allCardsDealt
      board.add_cards
      total_cards_dealt += 3
      addedCards = true
      properSet = false

    #User wants to pick a set
    else
        set = selection.split
        validEntry = check_valid_input_set(set, board, setErrorMessage)
      if validEntry
          #if valid check if it actually a set
          selectCards = board.cards_at(set)
          if Board.actual_set?(selectCards)
            setWasFound = true;
            properSet = true;
            board.remove_cards_at(set)
            #identify_player
            update_score(player_scores)
            if total_cards_dealt < 81 && board.board_size < 12
              board.add_cards
              total_cards_dealt += 3
            end
          end

      end
    end

        system('clear')
        board.displayCurrentHand

        #Only display score if entry was valid
        displayScore(player_scores) unless !validEntry

        #Let player know if all the cards have been dealt
        puts "Note: All cards have been dealt! ✊" unless !allCardsDealt

        #Let user know if cards were added when they choose to add
        puts "\t ✅  3 Cards have been added! ✅" unless !addedCards
        #IF they find a set
        puts "\t ✨  Yay! A set was found! ✨" unless !setWasFound || !validEntry

        if validEntry
            puts "\t\n 🔺 The set selected is not a proper set. Please try again. 🔺" unless properSet
        end

        #If user input was not valid
        puts "\n\t🔺 NOT A VALID ENTRY. PLEASE TRY AGAIN.🔺\n" unless validEntry
        #print proper corresponding error message
        puts "\n\t #{setErrorMessage[0]}" unless validEntry

      game_over = game_over?(total_cards_dealt, board)
      selection = selection_prompt(allCardsDealt) unless game_over

  end
  system('clear')

  #End game
  puts "\nThanks for playing! Here are the final score(s): "
  displayScore(player_scores)

  #Show the time at the end
  timeOut = Time.now
  puts"The time right now is " + timeOut.to_s
  displayTime(timeIn, timeOut)

  #Get and display the winner
  whoIsWinner(player_scores)
end


# Method Author: Jenn Alarcon- 2/5/17
# Description: Check if game is at an end
def game_over?(total_cards_dealt, board)
  return total_cards_dealt == 81 && board.board_size < 3 #&& !board.does_set_exist
end


#Author: Jenn Alarcon - 2/5/17
#Description: check if selected cards is a valid input
def check_valid_input_set(set, board, setErrorMessgae)

  if set.length != 3

    setErrorMessgae.push "\nInvalid selection. Please enter three cards when choosing a set. \n"
    return false
  else
    set.each do |card|
      card = card.to_i
      if !(card.between?(1, board.board_size))
        setErrorMessgae.push "\nYou selected a card that is not on the board. Please try again!"
        return false
      else
        if set[0] == set[1] || set[0] == set[2] || set[1] == set[2]
          setErrorMessgae.push "\nYou selected some of the same cards. Please select three DIFFERENT cards as a set."
          return false
        end

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
# Team Member           Date            Changes
# Raphael Huang         2/6/17          change line156
def update_score(scores)
  player = 1;
  #only ask which player if more than one player
  if scores.length > 1
    puts "Which player found the set?"
    player = gets.chomp!.to_i
    while player > player_scores.length do
      puts "Please enter the vaild number"
      player = gets.chomp!.to_i
    end
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
  until numPlayers.to_i > 0
    puts "Invalid entry. Enter a number of players greater than 0: "
    numPlayers = gets.chomp!
  end

  #initilizes all scores for each player to 0
  scores = Array.new(numPlayers.to_i,0)
end

#Author: Jenn Alarcon - 2/3/17
def selection_prompt(allCardsDealt)
  puts "_____________________________________________________________________"
  puts "GAME COMMANDS\n"
  puts "EXIT: to end the game "
  puts "'A' : to adds three more cards" unless allCardsDealt
  puts "\nOr just enter the card numbers you want to select as a set each followed by a space."
  puts "\n\tExample:  \n\tCard 1, Card 2, and Card 12 would be entered as followed: 1 2 12."
    puts "_____________________________________________________________________"
  print "YOUR SELECTION: "
  gets.chomp!
end


#Author: Raphael Huang - 2/6/17
#Description: Display the using time
def displayTime(timeIn, timeOut)
  timeUse = timeOut - timeIn
  t = timeUse.to_i
  hour = t / 3600
  min = (t % 3600) / 60
  second = ((t % 3600) % 60).to_i
  puts "The total using time is: " + hour.to_s + "hour(s) " + min.to_s + "minute(s) " + second.to_s + "seconds."  
end

#Author: Raphael Huang - 2/6/17
#Description: Display the winner
def whoIsWinner(scores)
  #find the max score
  maxScore = scores.max

  #find how many max scores, and get the index of these scores
  result = scores.each_index.select{ |i| scores[i] == maxScore}

  #if there is one winner, just display its name, ex: player1
  if result.length == 1
     puts "The winner is Player #{result[0] + 1}!"
  #if there are more than one players, display all their names
  else
     i = 0
     puts "The winners are: "
     while i < result.length do 
        puts "Player #{result[i] + 1}"
        i += 1
     end
  end
end

#STARTING THE GAME -- IT'S GONNA GET REAL FUN
play_the_game
