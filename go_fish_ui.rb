require './lib/game'
require './lib/player'
require './lib/card'

def start_go_fish

  puts "\n Welcome to Go Fish! \n"
  puts "Please enter the name of the first player: "
  player_one = gets.chomp
  puts "Please enter the name of the second player: "
  player_two = gets.chomp

  current_game = Game.create(player_one, player_two)
  play_menu(current_game)
end

def play_menu(current_game)
  puts "\n\n\n #{current_game.asking_player.name}'s turn!"
  puts "Press 's' when you're ready to see your hand."

  choice = gets.chomp
  if choice != 's'
    puts "Not a valid option."
  else
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    puts "#{current_game.asking_player.show_hand}"
    puts "\n\nWhat card number would you like to fish for?\n\n"
    card_value = gets.chomp
    current_game.ask_for_card(card_value)
    puts "#{current_game.asking_player.show_hand}"
    puts "Press any key to continue."
    new_choice = gets.chomp
    current_game.switch_player
    play_menu
  end
end

start_go_fish
