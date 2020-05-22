module RedWhite
  def red_white(move, code)
    red = 0
    move.each_with_index { |color, index| red += 1 if color == code[index] }
    white = 0
    (1..6).each { |i| white += [code.count(i), move.count(i)].min }
    white -= red
    [red, white]
  end
end