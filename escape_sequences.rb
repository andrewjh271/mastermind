# https://shiroyasha.svbtle.com/escape-sequences-a-quick-guide-1

module EscapeSequences
  # Movement

  def move_up(n); puts "\e[#{n}A" end # up - moves n lines up
  def move_down(n); puts "\e[#{n}B" end # down - moves n lines down
  def move_foward(n);  print "\e[#{n}C" end # forward - moves n characters forward
  def move_backward(n); print "\e[#{n}D" end # backward - moves n character backward

  def move_to_start_down(n); puts "\e[#{n}E" end # move to the beginning of n lines down 
  def move_to_end_up(n); puts "\e[#{n}F" end # move to the beginning of 4 lines up

  def move_to_column(x); puts "\e[#{x}F" end # move to column x

  def move_to(x, y); puts "\e[#{y};#{x}G" end # moves cursor to row y and column x

  def scroll_up(n); puts "\e[#{n}S" end # scroll n lines up
  def scroll_down(n); puts "\e[#{n}T" end # scroll n lines down
  
  # Erasing the screen

  def puts_clear; puts "\e[0J" end # Clear screen from cursor to the end
  def print_clear; print "\e[0J" end # Clear screen from cursor to the end
  def clear_up_to_cursor; puts "\e[1J" end # Clear screen up to the cursor
  def clear; puts "\e[2J" end # Clear entire screen

  def clear_from_cursor; puts "\e[0K" end # Clear line from cursor to the end
  def clear_to_cursor; puts "\e[1K" end # Clear line up to the cursor
  def clear_line; puts "\e[2K" end # Clear entire line

  # Cursor operations

  def show_cursor; puts "\e[?25h" end # show cursor
  def hide_cursor; puts "\e[?25l" end # hide cursor

  def save_cursor; puts "\e[s" end # save the position of the cursor
  def restore_cursor; puts "\e[u" end # restore the position of the cursor
end