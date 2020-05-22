require_relative 'red_white'

class Computer
  include RedWhite

  attr_accessor :game

  KEYS = [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [1, 0], [1, 1], 
    [1, 2], [1, 3],[2, 0], [2, 1], [2, 2], [3, 0], [4, 0]]

  def initialize(game, mode='knuth')
    @game = game
    @mode = mode
    @codes = []
    @set = []
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            @codes << [i + 1, j + 1, k + 1, l + 1]
            @set << [i + 1, j + 1, k + 1, l + 1]
          end
        end
      end
    end
  end

  def move
    @mode == 'knuth' ? move_knuth : move_random
  end

  def random_code
    code = []
    (0..3).each do |i|
      code[i] = rand(6) + 1
    end
    code
  end

  private

  def move_knuth
    if !@last_move
      move = [1, 1, 2, 2]
      game.enter_move(move)
      @last_move = move
      @last_key = game.red_white(move)
      @codes.delete(move)
      @set.delete(move)
      return
    elsif @set.length <= 2
      move = @set[0]
      game.enter_move(move)
      @set.delete(move)
      return

    end
    @set.select! { |pattern| red_white(pattern, @last_move) == @last_key }
    min_scores = @codes.map do |code|
      KEYS.reduce(1296) do |min_score, key|
        score = @set.count { |pattern| red_white(pattern, code) != key }
        # binding.pry
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
    @set.delete(move)
    @last_move = move
    @last_key = game.red_white(move)
    game.enter_move(move)
  end

  def move_random
    sleep(1)
    test_code = []
    (0..3).each do |i|
      test_code[i] = rand(6)
    end
    test_code
  end
end

