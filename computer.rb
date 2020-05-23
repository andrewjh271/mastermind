require_relative 'red_white'
require_relative 'escape_sequences'

class Computer

  include RedWhite
  include EscapeSequences

  attr_accessor :game

  KEYS = [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [1, 0], [1, 1], 
    [1, 2], [1, 3],[2, 0], [2, 1], [2, 2], [3, 0], [4, 0]]

  def initialize(game, mode='knuth')
    @game = game
    @mode = mode
    @codes = []
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            @codes << [i + 1, j + 1, k + 1, l + 1]
          end
        end
      end
    end
    @set = @codes.clone
  end

  def move
    @mode == 'knuth' ? move_knuth : move_random
  end

  def set_code
    code = []
    (0..3).each do |i|
      code[i] = rand(6) + 1
    end
    game.code = code
  end

  def failure
    "The computer couldn't break the code!"
  end

  private

  def move_knuth
    @throttle = @set.length < 200 ? true : false
    calc_countdown if @throttle
    if !@last_move
      # @set.length = 1296, but move will be immediate
      calc_countdown(0.04)
      move = [1, 1, 2, 2]
      game.enter_move(move)
      @last_move = move
      @last_key = game.red_white(move)
      @codes.delete(move)
      move_up(1)
      print_clear
      return
    elsif @set.length <= 2
      move = @set.pop
      game.enter_move(move)
      move_up(1)
      print_clear
      return
    end
    print "Calculating" unless @throttle
    @set.select! { |pattern| red_white(pattern, @last_move) == @last_key }
    m = 0
    min_scores = @codes.map do |code|
      m += 1
      print "." if (!@throttle && (m % 24 == 0))
      KEYS.reduce(1296) do |min_score, key|
        score = @set.count { |pattern| red_white(pattern, code) != key }
        score < min_score ? score : min_score
      end
    end
    min_max = min_scores.max
    move = nil
    min_scores.each_with_index do |score, i|
      if score == min_max && @set.include?(@codes[i])
        move = @codes[i]
        break
      end
    end
    unless move
      min_scores.each_with_index do |score, i|
        if score == min_max
          move = @codes[i]
          break
        end
      end
    end

    @codes.delete(move)
    @last_move = move
    @last_key = game.red_white(move)
    game.enter_move(move)

    move_up(1)
    print_clear

  end

  def move_random
    calc_countdown
    move = []
    (0..3).each do |i|
      move[i] = rand(6) + 1
    end
    game.enter_move(move)
    move_up(1)
    print_clear
  end

  def calc_countdown(sleep_time=0.06)
    print 'Calculating'
    25.times do
      sleep(sleep_time)
      print '.'
    end
  end

end