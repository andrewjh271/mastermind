module User
  def opening_prompt
    puts
    print 'M'.red
    print 'A'.cyan
    print 'S'.green
    print 'T'.magenta
    print 'E'.cyan
    print 'R'.yellow
    print 'M'.green
    print 'M'.red
    print 'I'.blue
    print 'N'.green
    print 'D'.magenta
    puts '!'.cyan
    puts
    
    begin
      puts "Please choose from the following: 1) Human Codemaker; Human Codebreaker"
      puts "                                  2) Human Codemaker; Computer Codebreaker"
      puts "                                  3) Computer Codemaker; Human Codebreaker"
      puts "                                  4) Computer Codemaker; Computer Codebreaker"
      puts
      user_choice = gets.chomp
      case(user_choice.to_i)
      when(1)
        puts "\e[2A" # Moves 2 line up
        puts "1) Human Codemaker; Human Codebreaker"
        puts
        return ['human', 'human']
      when(2)
        puts "\e[2A" # Moves 2 line up
        puts "2) Human Codemaker; Computer Codebreaker"
        puts
        return ['human', 'computer']
      when(3)
        puts "\e[2A" # Moves 2 line up
        puts "3) Computer Codemaker; Human Codebreaker"
        puts
        return ['computer', 'human']
      when(4)
        puts "\e[2A" # Moves 2 line up
        puts "4) Computer Codemaker; Computer Codebreaker"
        puts
        return ['computer', 'computer']
      else
        raise "Invalid input: #{user_choice}".italic
      end
    rescue StandardError=>e
      puts e
      retry
    end
  end
end