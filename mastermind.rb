require_relative 'color'
require_relative 'game'
require_relative 'player'
require_relative 'computer'
require_relative 'user'
# require 'pry'

mode = User.opening_prompt
game = Game.new()
computer = Computer.new(game)
player = Player.new(game)

# game.code = [3, 6, 3, 2]
mode[0] == 0 ? player.set_code : computer.set_code
game.display_code unless mode == [1, 0]
codemaker = mode[1] == 0 ? player : computer

# starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
loop do
  codemaker.move
  game.display
  if(game.code_broken?)
    puts "Code was broken!"
    break
  elsif(game.round == 12)
    puts codemaker.failure
    game.reveal_code
    break
  end
end
# ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# elapsed = ending - starting
# puts "Elapsed time: #{elapsed}"
puts