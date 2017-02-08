require_relative '../card'
require "test/unit"
class TestCard < Test::Unit::TestCase
  # Author: Sunny Patel - 2/5
  def test_card_init_pass01
    assert_nothing_raised {Card.new("1", "Diamond", "Solid", "Red")}
  end

  # Author: Sunny Patel - 2/5
  def test_card_init_fail01
    assert_raise {Card.new("4", "Diamond", "Solid", "Red")}
  end

  # Author: Sunny Patel - 2/5
  def test_card_init_fail02
    assert_raise {Card.new(1, "Diamond", "Solid", "Red")}
  end

  # Author: Sunny Patel - 2/5
  def test_card_init_fail03
    assert_raise {Card.new("1", "diamond", "Solid", "Red")}
  end

  # Author: Sunny Patel - 2/5
  def test_card_init_fail04
    assert_raise {Card.new("1", "Diamond", "kindaSolid", "Red")}
  end

  # Author: Sunny Patel - 2/5
  def test_card_init_fail05
    assert_raise {Card.new("1", "Diamond", "Solid", "blue")}
  end

end
