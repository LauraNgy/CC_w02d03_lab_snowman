class Word

  attr_reader :word, :display

  def initialize(word)
    @word = word
    @display = word.tr("a-zA-Z", "*")
  end

end
