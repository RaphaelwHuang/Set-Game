# testing the actual_set? method

require_relative '../board'
require_relative '../card'
require "test/unit"
 
class TestBoard < Test::Unit::TestCase

  # Author: Tony Su - 2/5     
  def test_actual_set
    #case 1: 3 different, 1 same
    card1 = Card.new("Diamond","1","Solid","Red")
    card2 = Card.new("Squiggle","1","Solid","Red")
    card3 = Card.new("Oval","1","Solid","Red")
    cards = [card1,card2,card3]
    assert_equal(true, Board.actual_set?(cards) )
    
  end
  
  # Author: Tony Su - 2/5 
  def test_actual_test_true
    #case 2: all different
    card1 = Card.new("Diamond","1","Open","Red")
    card2 = Card.new("Squiggle","2","Striped","Green")
    card3 = Card.new("Oval","3","Solid","Purple")
    cards = [card1,card2,card3]
    assert_equal(true, Board.actual_set?(cards) )	
  end

  # Author: Tony Su - 2/5 
  def test_actual_test_true03
    #case 3: 2 different, 2 same
    card1 = Card.new("Oval","1","Open","Red")
    card2 = Card.new("Oval","1","Striped","Green")
    card3 = Card.new("Oval","1","Solid","Purple")
    cards = [card1,card2,card3]
    assert_equal(true, Board.actual_set?(cards) )
  end

  # Author: Tony Su - 2/5 
  def test_actual_test_true04
    #case 4: 1 different, 3 same
    card1 = Card.new("Oval","2","Open","Red")
    card2 = Card.new("Oval","2","Open","Green")
    card3 = Card.new("Oval","2","Open","Purple")
    cards = [card1,card2,card3]
    assert_equal(true, Board.actual_set?(cards) )

  end

  # Author: Tony Su - 2/5 
  def test_actual_test_true05
    #case 5: not a set
    card1 = Card.new("Oval","1","Open","Red")
    card2 = Card.new("Oval","1","Striped","Green")
    card3 = Card.new("Oval","1","Solid","Green")
    cards = [card1,card2,card3]
    assert_equal(false, Board.actual_set?(cards) )
  end
  

  # Author: Tony Su - 2/5 
  def test_actual_test_false
    #case 6: not a set
    card1 = Card.new("Oval","1","Open","Red")
    card2 = Card.new("Oval","2","Striped","Green")
    card3 = Card.new("Oval","1","Solid","Purple")
    cards = [card1,card2,card3]
    assert_equal(false, Board.actual_set?(cards) )
  end

  # Author: Tony Su - 2/5 
  def test_actual_test_false02
    #case 7: not a set
    card1 = Card.new("Oval","1","Open","Red")
    card2 = Card.new("Diamond","1","Striped","Green")
    card3 = Card.new("Oval","1","Solid","Purple")
    cards = [card1,card2,card3]
    assert_equal(false, Board.actual_set?(cards) )
  end

 
end
