#Author: Kenton Steiner
#Creation Date: 1/30/17


require_relative 'card'
require_relative 'deck'
STARTINGCARDS = 12

class Board < Deck
	#deck and card can only be read
	#class variabel to keep track of number of sets found
	@@total_sets_found
	attr_reader :card, :deck
	
	attr_accessor :set

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
			# that is my old code, not sure why it didn't work.
			# Card::ATTRIBUTES.each do |item|
				# return false unless set.map{|card| card.item}.uniq.length != 2
			#end
		true
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
