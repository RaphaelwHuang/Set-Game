#Author: Kenton Steiner
#Creation Date: 1/30/17


require_relative 'card'
require_relative 'deck'
STARTINGCARDS = 12

class Board < Deck
	#deck and card can only be read
	#class variabel to keep track of number of sets found
	@@total_sets_found = 0
	attr_reader :card, :deck

	# Method Author: Kenton Steiner - 1/30/17
	# Description: Initialize the board array, deck, and create the starting board
	# Team Member           Date           Changes
	# Jenn Alarcon					2/1/17					modification to deck and board initlization of cards

	def initialize(cards = [])
		@board = cards
		@deck = Deck.new().deck
		STARTINGCARDS.times do
			card = @deck.shift
			@board.push(card)
		end
	end

	#Author: Kenton Steiner - 2/1/17
	#Description:
	# Team Member           Date           Changes
	#
	def render_board
		header = "\nCurrentBoard:\n"

	end

		#Author: Jennifer Alarcon - 2/1/17
		#Description: Show cards in current hand
		# Team Member           Date           Changes
		#
		def displayCurrentHand
			@board.length().times do |i|
				puts "Card #{i}".center(35)
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
	end

	# Method Author: Kenton Steiner - 2/1/17
	# Description:
	# Team Member           Date           Changes
	#
	def is_set?(i1,i2,i3)
		#potential_set = self.cards_at(indices)
		# actual_set = Card::is_this_a_set?(potential_set) # Need to create this function
		#puts "This is not a set! Try again!" unless actual_set
		return true
	end

	# Method Author: Jennifer Alarcon - 2/1/17
	# Description: Return the number of possible sets from hand
	# Team Member           Date           Changes
	#
	def total_possible_sets
		possible_sets = 0
		possibleCombination = @board.combination(3).to_a
		possibleCombination.each do |setOf3|
			setOf3.each do
				card1_index = @board.find_index(setOf3[0])
				puts card1_index
				card2_index = @board.find_index(setOf3[1])
				puts card2_index
				card3_index = @board.find_index(setOf3[2])
				puts card3_index
				puts "\n\n\n\n"
				if (is_set?(card1_index, card2_index,card3_index))
					possible_sets += 1
				end
			end



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
	#
	def remove_cards_at(indices)
		indices.each { |x| @board.delete_at(x) }
	end

	# Method Author: Kenton Steiner - 2/1/17
	# Description: Adds 3 new cards to the board
	# Team Member           Date           Changes
	#
	def add_cards
		3.times { @board.push(@deck.draw) }
	end





end
