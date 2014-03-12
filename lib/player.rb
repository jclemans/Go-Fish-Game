class Player

  attr_reader :name, :hand, :pairs_found, :winner

  def initialize(name)
    @name = name
    @hand = []
    @pairs_found = 0
    @winner = false
  end

  def set_hand(input_hand)
    @hand = input_hand
  end

  def add_card(card)
    @hand << card
  end

  def remove_card(card)
    @hand.delete_if {|a_card| a_card == card}
  end

  def match_card?(card_number)
    #select
    hand.each do |card|
      if card.number.downcase == card_number.downcase
        return true
      end
      false
    end
  end

  def pair_found
    @pairs_found += 1
  end

  def check_for_pairs
    for i in 1...hand.length
      if hand[i].number == hand[i-1].number
        self.pair_found
        self.remove_card(hand[i])
        self.remove_card(hand[i-1])
        self.check_for_pairs
      end
    end
  end
end
