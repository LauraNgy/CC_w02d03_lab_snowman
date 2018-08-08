class Word

  attr_reader :word, :display

  def initialize(word)
    @word = word
    @display = word.tr("a-zA-Z", "*")
  end

  def letter_in_word(char)
    return @word.include? char
  end

  def guess_letter(char)
    (0...@word.length).each do |i|
      @display[i] = char if @word[i].downcase() == char.downcase
    end
    return @display
  end

end
