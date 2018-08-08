class Game

  attr_reader :player, :word, :guessed_letters

  def initialize(player, word)
    @player = player
    @word = word
    @guessed_letters = []
  end

  def pass_letter(char)
    @word.guess_letter(char)
    @guessed_letters << char
  end

  def player_guess(char)
    if @word.letter_in_word(char) == true
      pass_letter(char)
    else
      @player.reduce_lives
    end
  end

  def game_state
    if @word.word == @word.display
      return "won"
    elsif @player.lives < 1
      return "lost"
    else
      return "playing"
    end
  end

end
