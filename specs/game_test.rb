require("minitest/autorun")
require("minitest/rg")
require_relative("../game")
require_relative("../word")
require_relative("../player")

class GameTest < MiniTest::Test

  def setup
    @player1 = Player.new("Simon")
    @word1 = Word.new("A new Word")
    @game = Game.new(@player1, @word1)
  end

  def test_game_has_player
    assert_equal(@player1, @game.player)
  end

  def test_game_has_word
    assert_equal(@word1, @game.word)
  end

  def test_has_guessed_letters
    assert_equal([], @game.guessed_letters)
  end

  def test_pass_letter
    @game.pass_letter("w")
    assert_equal("* **w W***", @word1.display)
  end

  def test_pass_letter_not_in_word
    @game.pass_letter("x")
    assert_equal("* *** ****", @word1.display)
  end

  def test_pass_letter_guessed_letters_increases
    @game.pass_letter("x")
    assert_equal(1, @game.guessed_letters.length)
  end

  def test_pass_letter_guessed_letters_increases
    @game.pass_letter("x")
    @game.pass_letter("y")
    @game.pass_letter("w")
    assert_equal("* **w W***", @word1.display)
    assert_equal(3, @game.guessed_letters.length)
  end

  def test_player_guess__right
    @game.player_guess("w")
    assert_equal(6, @player1.lives)
    assert_equal("* **w W***", @word1.display)
  end

  def test_player_guess__wrong
    @game.player_guess("x")
    assert_equal(5, @player1.lives)
    assert_equal("* *** ****", @word1.display)
  end

  def test_game_state__is_won
    @game.player_guess("a")
    @game.player_guess("n")
    @game.player_guess("e")
    @game.player_guess("w")
    @game.player_guess("o")
    @game.player_guess("r")
    @game.player_guess("d")
    assert_equal("A new Word", @word1.display)
    assert_equal("won", @game.game_state)
  end

  def test_game_state__is_lost
    @game.player_guess("x")
    @game.player_guess("y")
    @game.player_guess("z")
    @game.player_guess("b")
    @game.player_guess("c")
    @game.player_guess("f")
    assert_equal("lost", @game.game_state)
  end

  def test_game_state__is_playing
    @game.player_guess("x")
    @game.player_guess("y")
    @game.player_guess("z")
    @game.player_guess("e")
    @game.player_guess("w")
    assert_equal("playing", @game.game_state)
  end
end
