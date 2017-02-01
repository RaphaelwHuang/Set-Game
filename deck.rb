# Author::        Sunny Patel, Kenton Steiner
# Creation Date:: 1/27


load 'card.rb'
class Deck < Card
  # deck can only be read
  attr_reader :deck

  # Create a deck of 81 unique cards
  def initialize
    @deck = []
    Card::NUMBERS.each do |number|
      Card::SHAPES.each do |shape|
        Card::SHADINGS.each do |shading|
          Card::COLORS.each do |color|
            @deck << Card.new(number, shape, shading, color)
          end
        end
      end
    end
    @deck.shuffle!
  end
	# Method Author: Sunny Patel
  # Removes a card from @deck and returns it to caller
  def draw
    @deck.shift
  end
	#Author: Sunny Patel
  # Returns the number of cards in the deck
  def size
    @deck.length
  end

  # Method Author: Kenton Steiner - 1/30/17
	# Displays the number of cards left in the deck
  def display_size
    puts "# of Cards left in deck: #{size}"
  end
end
