#Author: Kenton Steiner
#Creation Date: 1/30/17


require_relative './card'
require_relative './deck'
STARTINGCARDS = 12
class Board < Deck
	#deck and card can only be read
	attr_reader :card, :deck
	
	# Method Author: Kenton Steiner - 1/30/17
	# Initialize the board array, deck, and create the starting board
	def initialize(cards = [])
		@board = cards
		@deck = :deck
		STARTINGCARDS.times do 
		card = @deck.draw
		@board.push(card)
		end
	end

	def render_board
		header = "\nCurrentBoard:\n"
		
				
	end

	#Author: Kenton Steiner - 2/1/17
	# Returns an array of the indices of the cards to check for a set
	def indicies_of(set)
		indices = []
		set.each {|card| indices << set.index(card) }
	end

	# Method Author: Kenton Steiner - 2/1/17
	def is_set at?(indices)
		potential_set = self.cards_at(indices)
		# actual_set = Card::is_this_a_set?(potential_set) # Need to create this function
		puts "This is not a set! Try again!" unless actual_set
	end
		

	# Method Author: Kenton Steiner - 2/1/17
	#Takes an array of indices (a set), and returns the cards at those indices
	def cards_at(indices)
		cards = []
		indices.each {|x| cards << @board[x] }
		cards
	end
	# Method Author: Kenton Steiner - 2/1/17
	#Takes an array of indices, the set found, and deletes the cards from the board
	def remove_cards_at(indices)
		indices.each { |x| @board.delete_at(x) }
	end

	# Method Author: Kenton Steiner - 2/1/17
	# Adds 3 new cards to the board
	def add_cards
		3.times { @board.push(@deck.draw) }
	end
		
	

end
