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
    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |l|
            @codes << [i, j, k, l]
          end
        end
      end
    end
    @set = @codes
  end

  def move
    @mode == 'knuth' ? move_knuth : move_random
  end



  private


  def move_knuth
    unless @last_move
      move = [0, 0, 1, 1]
      @last_move = move
      @last_key = game.red_white(move)
      @codes.delete(move)
      return
    end
    # @set = @codes.select { |pattern| red_white(pattern, @last_move)
    #    == red_white(@last_move, game.code) && @set.include?(pattern) }
    @set.select! { |pattern| red_white(pattern, @last_move) == @last_key }

    p @set
    p @set.length
    
    # mins = @codes.map do |pattern|
    #   scores = KEYS.map do |key|
    #     @set.count { |pattern| red_white(pattern) }
    #   end
    # end


    # @codes.delete(move)
    # @last_move = move
    # @last_key = game.red_white(move)
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

