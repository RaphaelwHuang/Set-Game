#Author: Kenton Steiner
#Creation Date: 1/30/17


require_relative './card'
require_relative './deck'

class Board < Deck
	#deck and card can only be read
	attr_reader :card, :deck
	
	# cards is the current array of cards on the board
	def initialize(cards = [])
		@cards = cards
	end

	def render_board
		header = "\nCurrentBoard:\n"
		@cards.each_with_index do |card, index|
				
	end

	def remove_cards
	end
	
	def add_cards
	end

end
