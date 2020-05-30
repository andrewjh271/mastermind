require_relative 'game'
require_relative 'escape_sequences'
require 'io/console'  

module User

  include EscapeSequences

  def opening_prompt
    puts
    print 'M'.red
    print 'A'.cyan
    print 'S'.green
    print 'T'.magenta
    print 'E'.cyan
    print 'R'.yellow
    print 'M'.red
    print 'I'.blue
    print 'N'.green
    print 'D'.magenta
    puts '!'.cyan
    puts
    
    begin
      puts "Please choose from the following: 1) Human Codemaker; Human Codebreaker"
      puts "                                  2) Human Codemaker; Computer Codebreaker"
      puts "                                  3) Computer Codemaker; Human Codebreaker"
      puts "                                  4) Computer Codemaker; Computer Codebreaker"
      puts "                                  5) Instructions"
      puts
      user_choice = gets.chomp
      case user_choice.to_i
      when 1
        move_up(2)
        puts "1) Human Codemaker; Human Codebreaker"
        puts
        ['human', 'human']
      when 2
        move_up(2)
        puts "2) Human Codemaker; Computer Codebreaker"
        puts
        ['human', 'computer']
      when 3
        move_up(2)
        puts "3) Computer Codemaker; Human Codebreaker"
        puts
        ['computer', 'human']
      when 4
        move_up(2)
        puts "4) Computer Codemaker; Computer Codebreaker"
        puts
        ['computer', 'computer']
      when 5
        'instructions'
      else
        raise "Invalid input: #{user_choice}".italic
      end
    rescue StandardError => e
      puts e.red
      retry
    end
  end

  def display_instructions
    clear
    move_up(150)
    hide_cursor
    puts

    instructions = <<~INSTRUCTIONS
    Mastermind is a code-breaking game between two players. The codemaker sets
    a code of four colors comprising any combination of the available six —
    #{'Red'.red}, #{'Blue'.blue}, #{'Green'.green}, #{'Magenta'.magenta}, #{'Cyan'.cyan}, or #{'Yellow'.yellow}. Duplicate colors are allowed;
    blanks are not. The codebreaker then has twelve moves to find the code.
    After each move, one #{Game::RED_KEY} is displayed for each correct color in the
    correct position, and one #{Game::WHITE_KEY} is displayed for each correct color in the
    incorrect position. A sample game:
    INSTRUCTIONS

    puts instructions
    puts
    sample_game
    puts
    print "Press any key to exit."
    STDIN.getch
    clear
    move_up(150)
    show_cursor
  end

  private

  def sample_game
    game = Game.new
    game.code = [5, 2, 5, 3]
    game.reveal_code
    puts
    game.enter_move([1, 4, 1, 4])
    game.display
    game.enter_move([2, 2, 6, 6])
    game.display
    game.enter_move([2, 3, 4, 5])
    game.display
    game.enter_move([5, 3, 3, 6])
    game.display
    game.enter_move([1, 3, 6, 1])
    game.display
    game.enter_move([1, 2, 3, 3])
    game.display
    game.enter_move([2, 5, 2, 5])
    game.display
    game.enter_move([2, 3, 5, 5])
    game.display
    game.enter_move([5, 2, 3, 5])
    game.display
    game.enter_move([5, 2, 5, 3])
    game.display
  end
end


