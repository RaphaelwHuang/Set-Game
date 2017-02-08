require_relative '../board'
require "test/unit"
class TestDeck < Test::Unit::TestCase
  # Author: Sunny Patel - 2/5
  def test_deck_init
    assert_nothing_raised {Deck.new}
  end

  # Author: Sunny Patel - 2/5
  def test_deck_draw_fullDeck
    deck = Deck.new
    assert_nothing_raised {deck.draw}
  end

  # Author: Sunny Patel - 2/5
  def test_deck_draw_emptyDeck
    deck = Deck.new
    assert_nothing_raised {81.times {deck.draw}}
  end

  # Author: Sunny Patel - 2/5
  def test_deck_size_fullDeck
    deck = Deck.new
    assert_equal(81, deck.size, "Expected size of 81.")
  end

  # Author: Sunny Patel - 2/5
  def test_deck_size_emptyDeck
    deck = Deck.new
    81.times {deck.draw}
    assert_equal(0, deck.size, "Expected size of 81.")
  end

  # Author: Sunny Patel - 2/5
  def test_deck_display_size_fullDeck
    print "Expected size of 81: Found "
    Deck.new.display_size
  end

  # Author: Sunny Patel - 2/5
  def test_deck_display_size_emptyDeck
    deck = Deck.new
    81.times {deck.draw}
    print "Expected size of 0: Found "
    deck.display_size
  end

end
