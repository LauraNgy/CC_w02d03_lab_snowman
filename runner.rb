require_relative("./game")
require_relative("./player")
require_relative("./word")

p "What word/phrase would you like the player to guess?"
input = gets.chomp()
system "clear"

p "Player, what is your name?"
name = gets.chomp()

@player1 = Player.new(name)
@word1 = Word.new(input)
@game = Game.new(@player1, @word1)

while @game.game_state == "playing"
  p "This is the word: #{@word1.display}"
  p "Please guess a letter or number"
  char = gets.chomp()
  while @game.guessed_letters.include?(char.downcase) || @game.input_is_acceptable(char) == false
    if @game.guessed_letters.include?(char.downcase)
      p "You've already guessed this character, guess again"
    else
      p "Please give ONE character"
    end
    char = gets.chomp()
  end
  @game.player_guess(char)
  if @word1.letter_in_word(char) == false
    p "Wrong guess, try again"
  else
    p "Correct!"
  end
end

if @game.game_state == "won"
      p "Congrats, #{name}, you guessed #{input}!"
  else
    p "#{name} is a loser!"
  end
