require_relative 'color'
require_relative 'game'
require_relative 'player'
require_relative 'computer'
require 'pry'


puts
game = Game.new()
computer = Computer.new(game)
player = Player.new(game)
# player.set_code
# game.display_code


game.code = [3, 6, 3, 2]
game.display_code

computer.move
game.display
computer.move
game.display
computer.move
game.display
computer.move
game.display
computer.move
game.display

# game.enter_move(move)
# game.display



# loop do
#   player.move
#   # move = computer.move
#   # game.enter_move(move)
#   game.display
#   if(game.code_broken?)
#     puts "Code was broken!"
#     break
#   elsif(game.round == 12)
#     puts "You couldn't break the code!"
#     break
#   end
# end

puts