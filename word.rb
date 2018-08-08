class Word

  attr_reader :word, :display

  def initialize(word)
    @word = word
    @display = word.tr("a-zA-Z", "*")
  end

  def letter_in_word(char)
    return @word.downcase.include? char.downcase
  end

  def guess_letter(char)
    (0...@word.length).each do |i|
      @display[i] = @word[i] if @word[i].downcase() == char.downcase
    end
    return @display
  end

end
