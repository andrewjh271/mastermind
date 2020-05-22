require_relative 'escape_sequences'

class Player

  include EscapeSequences

  def initialize(game)
    @game = game
  end

  def move
    print_possible_colors
    print 'Enter your move (format: BGMC): '
    user_input = gets.chomp
    if translate(user_input)
      @game.enter_move(translate(user_input))
      @game.clear_move_prompt
    else
      move_up(4)
      print_clear
      puts "Invalid entry. Please try again.".italic
      move
    end
  end

  def set_code
    print_possible_colors
    print 'Enter your code (format: BGMC): '
    user_input = gets.chomp
    if translate(user_input)
      @game.code = translate(user_input)
    else
      move_up(4)
      print_clear
      puts "Invalid entry. Please try again.".italic
      set_code
    end
  end

  def failure
    "You couldn't break the code!"
  end

  private

  def translate(string)
    return false unless string.length == 4
    string.upcase.split('').map do |char|
      case(char)
      when('R')
        1
      when('B')
        2
      when('G')
        3
      when('M')
        4
      when('C')
        5
      when('Y')
        6
      else
        return false
      end
    end
  end

  def print_possible_colors
    print 'C'.red
    print 'O'.cyan
    print 'L'.green
    print 'O'.magenta
    print 'R'.cyan
    print 'S'.yellow
    print ': '.green
    print 'Red'.red
    print ' '
    print 'Blue'.blue
    print ' '
    print 'Green'.green
    print ' '
    print 'Magenta'.magenta
    print ' '
    print 'Cyan'.cyan
    print ' '
    puts 'Yellow'.yellow
  end

end