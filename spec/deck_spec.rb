require 'rspec'
require 'deck'
require 'card'

describe 'Deck' do
  describe 'initialize' do
    it 'creates an instance of Deck' do
      new_deck = Deck.new
      new_deck.should be_an_instance_of Deck
    end
  end
  describe 'length' do
    it 'returns the length of the deck object which is also an array' do
      new_deck = Deck.new
      new_deck.length.should eq 52
    end
  end
end
