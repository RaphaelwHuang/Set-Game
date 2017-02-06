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
				puts "\n\t"
				puts "Card #{i+1}".center(35)
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
	
	# Method Author: Tony Su - 2/2/17
	# Description:  The method is a class method. The paremeter is the array of card. It return true if the cards in array is a set. False otherwise.
	# Team Member           Date           Changes
	#
	def self.actual_set?(set)
		return false unless set.length == 3
		if set.map{|card| card.number}.uniq.length == 2
			return false
		elsif set.map{|card| card.shading}.uniq.length == 2
			return false
		elsif set.map{|card| card.shape}.uniq.length == 2
			return false
		elsif set.map{|card| card.color}.uniq.length == 2
			return false
		end	
	
		true
	end

	# Method Author: Jennifer Alarcon - 2/1/17
	# Description: Return the number of possible sets from hand
	# Team Member           Date           Changes
	# Kenton Steiner				2/3/17				Method now checks if a set remains, if so, returns an array of the indices
	def does_set_exist
		set_exists = false
		possibleCombination = @board.combination(3).to_a
		possibleCombination.each do |setOf3|

			if actual_set?(setOf3)
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
	# Tony Su               2/6             change the index of @board to x-1 
	def cards_at(indices)
		cards = []
		indices.each {|x| cards << @board[x.to_i-1] }
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
