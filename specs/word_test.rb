require("minitest/autorun")
require("minitest/rg")
require_relative("../word")

class WordTest < MiniTest::Test

  def setup

    @word1 = Word.new("A new word")

  end

  def test_reveal_word
    assert_equal("A new word", @word1.word)
  end

  def test_reveal_display
    assert_equal("* *** ****", @word1.display)
  end

  def test_guess_letter
    assert_equal("A *** ****", @word1.guess_letter("a"))
  end

end
