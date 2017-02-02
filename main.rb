#Author: Jennifer Alarcon
#Creation Date: 2/1/17

require_relative 'board'

#Author: Jenn Alarconr - 2/1/17
#Description:
# Team Member           Date           Changes
#  Jenn               2/1/17          
#

def display
  board = Board.new()
  board.render_board
  board.displayCurrentHand
end

#Author: Raphael Huang - 2/2/17
#Description: play the game
# Team Member           Date           Changes

def play_the_game
  puts "Enter the number of players :"
  num = gets
  score = Array.new(num.to_i, 0)

# get the cards.length from board.rb (how to do?)

  $i = 12
  $cardNum = 81

  until $i == 81 || cards.length < 12 do
	display
	# method check_set(cards) need to create, which check whether there is a set
	if check_set(cards)
		puts "Enter your game number, from 0 to #{num-1}: "
		tem = gets
		no = tem.to_i
		puts "Enter the indices, which you think these are a set: "
		set = gets
		board.indicies_of(set.to_i)
  	
		if board.is_set(indices)
			score[no] +=1
			board.cards_at(indices)
			booard.remove_cards_at(indices)
			add_cards
 
		else
			score[no] -=1
		end
	else 
		board.add_cards
	end
	i +=3
  end

	puts "The winner is player NO.#{score.index(score.max)}, and the score is #{score.max}."
end

play_the_game
