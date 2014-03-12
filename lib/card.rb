class Card

  attr_reader :number, :suit

  def initialize(number_index, suit_index)
    @suits = {0 => "Clubs", 1 => "Diamonds", 2 => "Hearts", 3 => "Spades"}
    @numbers = {1 => "Ace", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten", 11 => "Jack", 12 => "Queen", 13 => "King"}

    @number = @numbers[number_index]
    @suit = @suits[suit_index]
  end

end
