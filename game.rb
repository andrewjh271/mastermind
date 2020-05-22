require_relative 'red_white'

class Game

  include RedWhite

  COLORS = ['0', '    '.bg_red, '    '.bg_blue, '    '.bg_green, '    '.bg_magenta,
    '    '.bg_cyan, '    '.bg_yellow]
  RED_KEY = '●'.red
  WHITE_KEY = '●'.gray
  BLANK = ' '

  attr_writer :code
  attr_reader :round

  def initialize
    @round = 0
    @key = []
    @code = []
  end

  def display()
    puts
    print "Round #{@round}  ".bold
    print ' ' if @round < 10
    print COLORS[@pattern[0]] + " "
    print COLORS[@pattern[1]] + " "
    print COLORS[@pattern[2]] + " "
    print COLORS[@pattern[3]] + " "
    puts " #{@key[0]} #{@key[2]}"
    print '          '
    print COLORS[@pattern[0]] + " "
    print COLORS[@pattern[1]] + " "
    print COLORS[@pattern[2]] + " "
    print COLORS[@pattern[3]] + " "
    puts " #{@key[1]} #{@key[3]}"
    puts
  end

  def display_code
    puts
    print "Code:  ".bold
    print COLORS[@code[0]] + " "
    print COLORS[@code[1]] + " "
    print COLORS[@code[2]] + " "
    puts COLORS[@code[3]] + " "
    print '       '
    print COLORS[@code[0]] + " "
    print COLORS[@code[1]] + " "
    print COLORS[@code[2]] + " "
    puts COLORS[@code[3]] + " "
    puts
    print "\e[?25l" # hide cursor
    print "Code will self destruct in ..."
    5.downto(1) do |i|
      print i
      sleep(1)
      print "\e[1D" # backward - moves 1 character backward
    end
    
    puts "\e[8A" # Moves 8 lines up
    puts "\e[0J" # Clear screen from cursor to the end
    print "\e[0J"
    puts "Code has been stored and is now hidden.".italic
    print "\e[0J"
    print "\e[?25h" # show cursor
    puts
  end

  def enter_move(move)
    @round += 1
    @pattern = move
    red, white = red_white(move)
    (0..3).each { |i| @key[i] = BLANK }
    (0...red).each { |i| @key[i] = RED_KEY }
    (red...(red + white)).each { |i| @key[i] = WHITE_KEY }
  end

  def code_broken?
    @key.all?(RED_KEY)
  end

  def red_white(move)
    super(move, @code)
  end

  def clear_move_prompt
    puts "\e[4A" # Moves 4 lines up
    puts "\e[0J" # Clear screen from cursor to the end
    print "\e[0J" # Clear screen from cursor to the end
  end

  def reveal_code
    puts
    print "Code:  ".bold
    print COLORS[@code[0]] + " "
    print COLORS[@code[1]] + " "
    print COLORS[@code[2]] + " "
    puts COLORS[@code[3]] + " "
    print '       '
    print COLORS[@code[0]] + " "
    print COLORS[@code[1]] + " "
    print COLORS[@code[2]] + " "
    puts COLORS[@code[3]] + " "
  end

end