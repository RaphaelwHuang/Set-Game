=begin
	Card class represents a single card from the game set.
	Cards have 4 properties: Number, Symbol, Shading, Color
	Number: 1, 2 or 3
	Symbol: Diamond, Squiggle, Oval
	Shading: Solid, Striped, Open
	Color: Red, Green, Purple
=end
class Card
	NUMBER = %w(1 2 3)
	SYMBOL = %w(Diamond Squiggle Oval)
	SHADING = %w(Solid Striped Open)
	COLOR = %w(Red Green Purple)

	attr_accessor :number, :symbol, :shading, :color

	def initialize(id)
		self.number = NUMBER[id % 3]
		self.symbol = SYMBOL[id % 3]
		self.shading = SHADING[id % 3]
		self.color = COLOR[id % 3]
	end

	def display
		puts self.number
		puts self.symbol
		puts self.shading
		puts self.color
	end
end

var = Card.new(4)
var.display
