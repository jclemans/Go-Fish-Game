require 'card'

class Deck

  attr_reader :full_deck

  def initialize
    @full_deck = []
    for i in 1..13 do
      for j in 0..3 do
        @full_deck << Card.new(i,j)
      end
    end
  end

  def length
    @full_deck.length
  end

  def get_card(index)
    @full_deck[index]
  end
end
