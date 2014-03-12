require 'rspec'
require 'card'

describe Card do
  describe 'initialize' do
    it 'creates an instance of Card' do
      new_card = Card.new(1,2)
      new_card.should be_an_instance_of Card
    end
    it 'creates a card based on an index for number and suit' do
      new_card = Card.new(1,2)
      new_card.number.should eq 'Ace'
      new_card.suit.should eq 'Hearts'
    end
  end
end

