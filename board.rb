#Author: Kenton Steiner, Jenn Alarcon, Tony Su, Raphael Huang
#Creation Date: 1/30/17

require_relative 'deck'
STARTINGCARDS = 12

class Board < Deck
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
				puts "\tCard #{i+1}"
				puts @board[i]
			end
		end

	#Author: Kenton Steiner - 2/1/17
	#Description: Returns an array of the indices of the cards to check for a set
	# Team Member           Date           Changes
	#
	def indices_of(set)
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
	
	# Method Author: Kenton Steiner - 2/1/17
	# Description:Adds 3 new cards to the board
	# Team Member           Date           Changes
	#
	def add_cards
		3.times { @board << @deck.draw }
	end

	# Method Author: Jennifer Alarcon - 2/1/17
	# Description: Return the number of possible sets from hand
	# Team Member           Date           Changes
	# Kenton Steiner				2/3/17				Method now checks if a set remains, if so, returns an array of the indices
	#  Tony Su                             2/7/17              change the method to add cards if there is no set on board.
	def does_set_exist!
		true_set = []
		while true_set.length == 0 do
			possibleCombination = @board.combination(3).to_a
			possibleCombination.each do |setOf3|  
				if Board.actual_set?(setOf3)
					true_set = setOf3
					break
				end 
			end
			if true_set.length == 0
				add_cards
			end
		end
		return true_set
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

	# Method Author: Kenton Steiner, Jennifer Alarcon - 2/1/17
	# Decription: Takes an array of indices (the set found) and deletes the cards from the board
	# Team Member           Date           Changes
	# Jenn									2/3/17 				convert from string to integer value
	# Jenn									2/5/17 				changed algorithm, was deleting wrong cards
	# 
	def remove_cards_at(indices)
		cardToDelete1 = @board[indices[0].to_i-1]
		cardToDelete2 = @board[indices[1].to_i-1]
		cardToDelete3 = @board[indices[2].to_i-1]

		@board.delete(cardToDelete1)
		@board.delete(cardToDelete2)
		@board.delete(cardToDelete3)
	end

     
        # Method Author: Raphael Huang  - 2/6/17
	# Description: remove the cards from the board for the AI computer
	# Team Member           Date           Changes
	def remove_cards_forAI(cardToRemove1, cardToRemove2, cardToRemove3)
		@board.delete(cardToRemove1)
		@board.delete(cardToRemove2)
		@board.delete(cardToRemove3)
	end



	# Method Author: Kenton Steiner - 2/2/17
	# Description: Returns the size of the board
	# Team Member           Date           Changes
	#
	def board_size
		@board.size
	end

end
