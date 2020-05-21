require_relative 'color'
require_relative 'game'
require_relative 'player'
require_relative 'computer'


puts
game = Game.new()

player = Player.new(game)
player.set_code
game.display_code


# (0..3).each do |i|
#   game.code[i] = rand(6)
# end

# game.code = [1, 1, 0, 5]

# game.display_code
# computer = Computer.new(game, 'knuth')

# move = computer.move
# move = computer.move

# game.enter_move(move)
# game.display



loop do
  player.move
  # move = computer.move
  # game.enter_move(move)
  game.display
  if(game.code_broken?)
    puts "Code was broken!"
    break
  elsif(game.round == 12)
    puts "You couldn't break the code!"
    break
  end
end

puts