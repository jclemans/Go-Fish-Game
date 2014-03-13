require 'rspec'
require 'card'
require 'game'
require 'deck'

describe 'Game' do
  describe 'initialize' do
    it 'creates a new instance of Game' do
      new_game = Game.new('Tara', 'Jeremy')
      new_game.should be_an_instance_of Game
    end
    it 'creates a full deck of cards' do
      new_game = Game.new('Bill', 'Ted')
      new_game.available_cards.length.should eq 52
    end
  end
  describe '.create' do
    it 'creates an instance of Game with two Players and one Deck' do
      new_game = Game.create('Bill', 'Ted')
      new_game.player_one.name.should eq 'Bill'
    end
  end
  describe 'build_hand' do
    it 'builds a hand-array made up of 7 random cards' do
      new_game = Game.create('Bill', 'Ted')
      new_game.available_cards.length.should eq 38
    end
  end
  describe 'is_over?' do
    it 'returns true if the game is over' do
      new_game = Game.create('Bill', 'Ted')
      new_game.available_cards = []
      new_game.is_over?.should eq true
    end
  end
end
