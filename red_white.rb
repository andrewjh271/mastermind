module RedWhite
  def red_white(move, code)
    red = (0..3).count { |i| move[i] == code[i] }
    white = 0
    (1..6).each { |i| white += [move.count(i), code.count(i)].min }
    white -= red
    [red, white]
    # I prefer this single line to find white, but it is slightly slower
    # white = (1..6).sum { |i| [move.count(i), code.count(i)].min } - red
  end
end
