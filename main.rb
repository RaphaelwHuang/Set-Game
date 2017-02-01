#Author: Jennifer Alarcon
#Creation Date: 1/30/17

require_relative 'deck'

#Method Author: Jennifer Alarcon - 1/30/17

def main
#Create a fresh deck
  deck = Deck.new().deck
  deckSize = deck.size
  
end


#Method Author: Jennifer Alarcon - 1/30/17
#Dislay the ccurrent cards in hand with card number and hand
def displayHand(cards)
  i = 1
  cards.each do |card, index|
    print "\n"+ "Card #{i}".center(35) +"\n"
    puts card
    i += 1
  end
end



main
