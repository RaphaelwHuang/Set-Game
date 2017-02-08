# Author::        Sunny Patel
# Creation Date:: 1/26
#
# Card class represents a single card from the game set.
# Cards have 4 properties: Number, Symbol, Shading, Color
# Number: 1, 2 or 3
# Symbol: Diamond, Squiggle, Oval
# Shading: Solid, Striped, Open
# Color: Red, Green, Purple
require 'colorize'
class Card

	# Arrays of card attributes
	NUMBERS = %w(1 2 3)
	SHAPES = %w(Diamond Squiggle Oval)
	SHADINGS = %w(Solid Striped Open)
	COLORS = %w(Red Green Purple)

	# Created by: Sunny Patel
	# Date created: 1/26
	# Modifications:
	# 	Changed to read-only from read-write
	# 	Changed back to read-write after tests failed
	attr_accessor :number, :shape, :shading, :color

#Created by: Sunny Patel
# Date created: 1/26
# Description:
# 	Initializes the cards.
# 			- Parameters can be entered in any order.
# 			- Expects all parameters to be strings that are
# 	included in the corresponding attribute array
# 	Expects exactly 4 parameters
#
# Team Member           Date           Changes
#
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

	# Created by: Sunny Patel
	# Date created: 2/5
	# Description: Returns true is self is a valid card.
	def is_card?()
		SHAPES.include?(self.shape) && COLORS.include?(self.color) && NUMBERS.include?(self.number) &&\
		SHADINGS.include?(self.shading)
	end

#Created by: Sunny Patel
# Date created: 1/26
# Description: Returns the card as the string formatted as such:
# => 		"number symbol shading color"
# Team Member           Date           Changes
# Jenn Alarcon		1/30/17		Modified String Dislay


	def to_s2
				return	"\t++++++++++++++++++\n"+
										"\t+\t\t+\n"+
										"\t+\t\t+\n"+
										"#{color.upcase.center(35)}\n"+
										"#{shape}-#{shading}".center(35)+
										"\n#{get_card}\n"+
											"\t+\t\t+\n"+
											"\t+\t\t+\n"+
										"\t++++++++++++++++++\n"
	end

#Created by: Jenn Alarcon
#Description: Prints card
# Team Member           Date           Changes
# Tony SU		1/30/17		change line 124
	def to_s
			s =""
			card = ""
			if shape == "Diamond"
				if shading == "Solid"
						s = " ◆"
				elsif shading == "Striped"
							s = "-◇ -"
				elsif shading == "Open"
					s = " ◇"
				end


			elsif shape == "Squiggle"
				if shading == "Solid"
					s = " ⧓"
				elsif shading == "Striped"
					s = "-⋈ -"
				elsif shading == "Open"
						s = " ⋈"
				end

			elsif shape == "Oval"
				if shading == "Solid"
						s= " ●"
				elsif shading == "Striped"
						s = "-◯ -"
				elsif shading == "Open"
					 	s= " ◯"
				end

			end

			number.to_i.times do 
				if color == "Green"
						puts "\t"+ s.colorize(:green)
				elsif color == "Red"
						puts "\t"+ s.colorize(:red)
				elsif color == "Purple"
						puts "\t"+ s.colorize(:magenta)
				end 		
			
			end
			return " "

		end
end
