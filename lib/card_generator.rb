require './lib/card'

class CardGenerator

  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def cards
    cards = []

    f = File.open(@filename, "r")
    f.each_line do |line|
      # .chomp removes carriage return \n
      bits = line.chomp.split(',')

      question = bits[0]
      answer = bits[1]
      category = bits[2]

      card = Card.new(question, answer, category)
      cards << card
    end

    f.close
    cards

  end

end
