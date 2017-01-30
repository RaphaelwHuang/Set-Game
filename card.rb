# Author::        Sunny Patel
# Creation Date:: 1/26
#
# Card class represents a single card from the game set.
# Cards have 4 properties: Number, Symbol, Shading, Color
# Number: 1, 2 or 3
# Symbol: Diamond, Squiggle, Oval
# Shading: Solid, Striped, Open
# Color: Red, Green, Purple

class Card

	# Arrays of card attributes
	NUMBERS = %w(1 2 3)
	SHAPES = %w(Diamond Squiggle Oval)
	SHADINGS = %w(Solid Striped Open)
	COLORS = %w(Red Green Purple)

	attr_accessor :number, :shape, :shading, :color

=begin 
	Initializes the cards.
   - Parameters can be entered in any order.
   - Expects all parameters to be strings that are
   included in the corresponding attribute array
	Expects exactly 4 parameters
=end

	def initialize(*param)
    raise "Expected 4 parameters" if param.length != 4
    param.each do |value|
      if SHAPES.include?(value) && self.shape.nil?
        self.shape = value
      elsif COLORS.include?(value) && self.color.nil?
        self.color = value
      elsif NUMBERS.include?(value) && self.number.nil?
        self.number = value
      elsif SHADINGS.include?(value) && self.shading.nil?
        self.shading = value
      else
        raise "Unexpected Parameter: Intialization of Card failed."
      end
    end
  end

  # Returns the card as the string formatted as such:
  # "number symbol shading color"
	def to_s
    return "#{number} #{shape} #{shading} #{color}"
	end
end
