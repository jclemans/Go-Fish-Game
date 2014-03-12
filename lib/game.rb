# require 'deck'
require 'card'
require 'player'

class Game
  attr_reader :available_cards, :player_one, :player_two

  def Game.create(name_one, name_two)
    new_game = Game.new(name_one, name_two)
    hand_one = new_game.build_hand
    hand_two = new_game.build_hand
    new_game.player_one.set_hand(hand_one)
    new_game.player_two.set_hand(hand_two)
    @asking_player = @player_one
    @responding_player = @player_two
    new_game
  end

  def initialize(name_one, name_two)
    @available_cards = []
    for i in 1..13 do
      for j in 0..3 do
        @available_cards << Card.new(i,j)
      end
    end
    @player_one = Player.new(name_one)
    @player_two = Player.new(name_two)
    @upper_range = 52
  end

  def build_hand
    new_hand = []
    for i in 1..7 do
      index = rand(@upper_range)
      new_hand << @available_cards[index-1]
      @available_cards.delete_at(index-1)
      @upper_range -= 1
    end
    new_hand
  end

  def ask_for_card(card)
    if @responding_player.match_card?(card)
      @asking_player.add_card(card)
      @responding_player.remove_card(card)
      @asking_player.check_for_pairs
    else
      go_fish(@asking_player)
      @asking_player.check_for_pairs
    end
    @switch_player
  end

  def switch_player
    if @asking_player == @player_one
      @asking_player = @player_two
      @responding_player = @player_one
    else
      @asking_player = @player_one
      @responding_player = @player_two
    end
  end

  def go_fish(player)
    index = rand(@upper_range)
    player.hand << @available_cards[index-1]
    @available_cards.delete_at(index-1)
    @upper_range -= 1
    player.check_for_pairs
  end
end

#make two hands of random Cards
#use all_available when doing draw_card function to make sure you're not reusing Cards
#if all_available is ever empty, game over
#make hand: every new card is random, so just create a bunch of cards
#go-fish: just make new card, because they're all random

