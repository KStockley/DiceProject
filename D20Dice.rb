#!/usr/bin/env ruby
require "./D20Constants.rb"

def dnd_dice
  system("clear")

  while true
    error = false
    total = 0 #results total starts at 0 for each roll
    operator = "+" #default to addition for the very first element
    
    print "Enter the dice to be rolled (3d6 + 2 for example), 'help' or 'exit': "
    input = gets.strip.split(' ') #separate each piece of the die roll

    if input.empty? || input[0] == "help" #present help document
      print TUTORIAL
      next
    elsif input[0] == 'dice'
      print DICE_HELP
      next
    end

    if input[0] == "exit" #check for exit condition
      return
    end

    #for each element of <input>
    input.each do |ele|
      if ele.match(/^\d+d(4||6||8||10||12||20||100)$/) #if the element is a die roll in <Integer>d<Integer> format
        result = roll_dice(ele.split('d'))

        case operator          #roll the dice and apply the result(s) to <total> via <operator>
        when "+"
          total += result
        when "-"
          total -= result
        when "/"
          total /= result
        when "*"
          total *= result
        end

      elsif ele == "+" || ele == "-" || ele == "\/" || ele == "*" #if the element is an arithmetic operator (+, -, *, or /)
        operator = ele         #store it in <operator>
        puts "\n\t#{operator}"

      elsif ele.match(/^\d+$/) #if the element is a constant
        puts "\n\t#{ele}"

        case operator          #apply the constant to <total> via <operator>
        when "+"
          total += ele.to_i
        when "-"
          total -= ele.to_i
        when "/"
          total /= ele.to_i
        when "*"
          total *= ele.to_i
        end
        
      else
        #Invalid input response
        puts "\nERROR: #{ele} is an invalid entry. Please refer to the 'help' command\n\n"
        error = true
        break
      end
    end
    unless error
      puts "\n\t="
      puts "\nFinal total: #{total}"
    end
  end
end

def roll_dice (dice)
  #convert the numbers of dice and sides to Integers
  number = dice[0].to_i
  sides = dice[1].to_i

  case sides #roll the specified sided die the specified number of times
  when 4
    D4.roll(number)
  when 6
    D6.roll(number)
  when 8
    D8.roll(number)
  when 10
    D10.roll(number)
  when 12
    D12.roll(number)
  when 20
    D20.roll(number)
  when 100
    D100.roll(number)
  end
end

dnd_dice
