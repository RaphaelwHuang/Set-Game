# Author::        Sunny Patel
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

  # Removes a card from @deck and returns it to caller
  def draw
    @deck.shift
  end

  # Returns the number of cards in the deck
  def size
    @deck.length
  end
end
