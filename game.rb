require_relative 'red_white'
require_relative 'escape_sequences'

class Game

  include RedWhite
  include EscapeSequences

  # COLORS[] in indexes 1-6 to match Donald Knuth's convention
  COLORS = [nil, '    '.bg_red, '    '.bg_blue, '    '.bg_green, '    '.bg_magenta,
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
    hide_cursor
    print "Code will self destruct in ..."
    5.downto(1) do |i|
      print i
      sleep(1)
      move_backward(1)
    end
    move_up(8)
    puts_clear
    print_clear
    puts "Code has been stored and is now hidden.".italic
    print_clear
    show_cursor
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
    move_up(4)
    puts_clear
    print_clear
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