#Author: Kenton Steiner, Jenn Alarcon
#Creation Date: 1/30/17

require_relative 'deck'
STARTINGCARDS = 12

class Board < Deck
	#class variable to keep track of number of sets found
	@@total_sets_found
	attr_reader :card, :deck

	# Method Author: Kenton Steiner - 1/30/17
	# Description: Initialize the board array, deck, and create the starting board
	# Team Member           Date           Changes
	# Jenn Alarcon					2/1/17					modification to deck and board initlization of cards
	# Sunny Patel						2/5/17					utilized deck methods properly

	def initialize(cards = [])
		@board = cards
		@deck = Deck.new
		STARTINGCARDS.times { @board << @deck.draw }
	end

		#Author: Jennifer Alarcon - 2/1/17
		#Description: Show cards in current hand
		# Team Member           Date           Changes
		# Kenton Steiner				2/2/17				Added header to the board
		def displayCurrentHand
			header = "\nCurrentBoard:\n"
			@board.length().times do |i|
				puts "\nCard #{i+1}".center(35)
				puts @board[i]
			end
		end

	#Author: Kenton Steiner - 2/1/17
	#Description: Returns an array of the indices of the cards to check for a set
	# Team Member           Date           Changes
	#
	def indicies_of(set)
		indices = []
		set.each {|card| indices << set.index(card) }
		indices
	end

	# Method Author: Kenton Steiner - 2/1/17
	# Description:
	# Team Member           Date           Changes
	#
	def is_set?(i1)
		#potential_set = self.cards_at(indices)
		# actual_set = Card::is_this_a_set?(potential_set) # Need to create this function
		#puts "This is not a set! Try again!" unless actual_set
		return true
	end

	# Method Author: Jennifer Alarcon - 2/1/17
	# Description: Return the number of possible sets from hand
	# Team Member           Date           Changes
	# Kenton Steiner				2/3/17				Method now checks if a set remains, if so, returns an array of the indices
	def does_set_exist
		set_exists = false
		possibleCombination = @board.combination(3).to_a
		possibleCombination.each do |setOf3|

			if is_set?(setOf3)
					true_set = setOf3
					set_exists = true
					break
			end

		set_exists ? indices_of(true_set) : nil


	end
end


	# Method Author: Kenton Steiner - 2/1/17
	#Description: Takes an array of indices (a set), and returns the cards at those indices
	# Team Member           Date           Changes
	#
	def cards_at(indices)
		cards = []
		indices.each {|x| cards << @board[x] }
		cards
	end

	# Method Author: Kenton Steiner - 2/1/17
	# Decription: Takes an array of indices, the set found, and deletes the cards from the board
	# Team Member           Date           Changes
	# Jenn									2/3/17 				convert from string to integer value
	def remove_cards_at(indices)
		indices.each { |x| @board.delete_at(x.to_i-1) }
	end

	# Method Author: Kenton Steiner - 2/1/17
	# Description:Adds 3 new cards to the board
	# Team Member           Date           Changes
	#
	def add_cards
		3.times { @board << @deck.draw }
	end

	# Method Author: Kenton Steiner - 2/2/17
	# Description: Returns the size of the board
	# Team Member           Date           Changes
	#
	def board_size
		@board.size
	end

end
