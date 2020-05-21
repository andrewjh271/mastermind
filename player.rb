class Player

  def initialize(game)
    @game = game
  end

  def move
    print_possible_colors
    print 'Enter your move (format: BGMC): '
    user_input = gets.chomp
    if translate(user_input)
      @game.enter_move(translate(user_input))
    else
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
      puts "Invalid entry. Please try again.".italic
      set_code
    end
  end

  private

  def translate(string)
    string.upcase.split('').map do |char|
      case(char)
      when('R')
        0
      when('B')
        1
      when('G')
        2
      when('M')
        3
      when('C')
        4
      when('Y')
        5
      else
        false
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