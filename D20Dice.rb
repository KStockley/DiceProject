#!/usr/bin/env ruby
require "./D20Constants.rb"

def dnd_dice
  system("clear")

  while true
    error = false
    sum = 0 #results sum starts at 0 for each roll
    operator = "+" #default to addition for the very first element
    output = []
    
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
        result = roll_dice(ele.split('d')) #roll using number of dice and number of sides
        output << result.sum

        case operator          #and apply the result(s) to <sum> via <operator>
        when "+"
          sum += result.sum
        when "-"
          sum -= result.sum
        when "/"
          sum /= result.sum
        when "*"
          sum *= result.sum
        end

        puts "\n<\t#{ele}: #{result.join(" + ")} = #{result.sum}"

      elsif ele == "+" || ele == "-" #if the element is an arithmetic operator (+ or -)
        operator = ele         #store it in <operator>
        output << operator

      elsif ele.match(/^\d+$/) #if the element is a constant
        output << ele

        case operator          #apply the constant to <sum> via <operator>
        when "+"
          sum += ele.to_i
        when "-"
          sum -= ele.to_i
        end
        
      else
        #Invalid input response
        puts "\nERROR: #{ele} is an invalid entry. Please refer to the 'help' and 'dice' commands\n\n"
        error = true
        break
      end
    end
    unless error
      puts "\n<\t#{output.join(' ')} = #{sum}"
    end
  end
end

def roll_dice (dice)
  #convert the numbers of dice and sides to Integers
  number = dice[0].to_i
  sides = dice[1].to_i
  results = []

  number.times { |i| results << rand(sides) + 1 }

  results
end

dnd_dice
