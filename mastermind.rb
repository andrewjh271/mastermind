require_relative 'color'
require_relative 'game'
require_relative 'player'
require_relative 'computer'
require_relative 'user'
# require 'pry'

include User

mode = opening_prompt
until mode != 'instructions'
  display_instructions
  mode = opening_prompt
end
game = Game.new
computer = Computer.new(game)
player = Player.new(game)

# game.code = [3, 6, 3, 2]
mode[0] == 'human' ? player.set_code : computer.set_code
mode == ['computer', 'human'] ? game.display_generation : game.display_code
codemaker = mode[1] == 'human' ? player : computer

# starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
loop do
  codemaker.move
  game.display
  if game.code_broken?
    puts "Code was broken!"
    break
  elsif game.round == 12
    puts codemaker.failure
    game.reveal_code
    break
  end
end
# ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
# elapsed = ending - starting
# puts "Elapsed time: #{elapsed}"
puts
