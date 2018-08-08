require("minitest/autorun")
require("minitest/rg")
require_relative("../player")

class PlayerTest < MiniTest::Test

  def setup

    @player1 = Player.new("Simon")

  end

  def test_player_has_name
    assert_equal("Simon", @player1.name)
  end

  def test_player_has_lives
    assert_equal(6, @player1.lives)
  end

  def test_reduce_lives
    @player1.reduce_lives
    @player1.reduce_lives
    assert_equal(4, @player1.lives)
  end

end
