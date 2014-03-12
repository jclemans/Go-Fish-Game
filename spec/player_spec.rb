require 'rspec'
require 'player'
require 'card'
require 'game'

describe 'Player' do
  describe 'initialize' do
    it 'creates an instance of player' do
      new_player = Player.new('Tom')
      new_player.should be_an_instance_of Player
    end
  end
  describe 'set_hand' do
    it 'accepts a handed-in hand of cards' do
      new_player = Player.new('Molly')
      new_player.set_hand(['a card', 'another card'])
      new_player.hand.length.should eq 2
    end
  end
  describe 'add_card' do
    it 'adds a given card to the players hand' do
      new_player = Player.new('Molly')
      new_player.set_hand(['one', 'two'])
      new_player.add_card('three')
      new_player.hand.length.should eq 3
    end
  end
  describe 'remove_card' do
    it 'removes a given card to the players hand' do
      new_player = Player.new('Molly')
      new_player.set_hand(['one', 'two'])
      new_player.remove_card('one')
      new_player.hand.length.should eq 1
    end
  end
  describe 'match_card?' do
    it 'returns true if a card exists in a players hand' do
      new_player = Player.new('Molly')
      new_card = Card.new(1,1)
      new_card2 = Card.new(2,2)
      new_player.set_hand([new_card, new_card2])
      new_player.match_card?('Two').should eq true
    end
  end
  describe 'check_for_pairs' do
    it 'removes pairs from a players hand' do
      new_player = Player.new('Molly')
      new_card = Card.new(2,1)
      new_card2 = Card.new(2,2)
      new_player.set_hand([new_card, new_card2])
      new_player.check_for_pairs
      new_player.hand.length.should eq 0
      new_player.pairs_found.should eq 1
    end
  end
end

