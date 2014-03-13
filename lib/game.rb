
class Game
  attr_accessor :available_cards, :player_one, :player_two, :winner, :asking_player, :responding_player

  def Game.create(name_one, name_two)
    new_game = Game.new(name_one, name_two)
    hand_one = new_game.build_hand
    hand_two = new_game.build_hand
    new_game.player_one.set_hand(hand_one)
    new_game.player_two.set_hand(hand_two)
    @asking_player = @player_one
    @responding_player = @player_two
    @winner = ''
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
      puts "You get to GO FISH!!\n\n"
      go_fish(@asking_player)
      @asking_player.check_for_pairs
    end
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

  def is_over?
    if @available_cards.length > 0
      false
    else
      true
    end
  end

  def who_wins
    if @player_one.pairs_found > @player_two.pairs_found
      @winner = @player_one.name
    elsif @player_two.pairs_found > @player_one.pairs_found
      @winner = @player_two.name
    else
      @winner = 'Nobody!'
    end
  end
end

