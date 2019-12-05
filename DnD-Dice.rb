#!/usr/bin/env ruby
require "./DieClass.rb"

#generate the standard set of dice for Dungeons and Dragons
D4 = Die.new 4
D6 = Die.new 6
D8 = Die.new 8
D10 = Die.new 10
D12 = Die.new 12
D20 = Die.new 20

def dnd_dice
  system("clear")

  while true
    total = 0 #results total starts at 0 for each roll
    operator = "+" #default to addition for the very first element
    print "Enter the dice to be rolled (3d6 for example) or 'exit': "
    input = gets.strip.split(' ') #separate each piece of the die roll

    if input[0] == "exit" #check for exit condition
      return
    end

    #for each element of <input>
    input.each do |ele|
      if ele.match(/\d+d\d+/) #if the element is a die roll in <Integer>d<Integer> format
        case operator #roll the dice and apply the result(s) to <total> via <operator>
        when "+"
          total += roll_dice(ele.split('d'))
        when "-"
          total -= roll_dice(ele.split('d'))
        when "/"
          total /= roll_dice(ele.split('d'))
        when "*"
          total *= roll_dice(ele.split('d'))
        end
      elsif ele == "+" || ele == "-" || ele == "\/" || ele == "*" #if the element is an arithmetic operator (+, -, *, or /)
        operator = ele #store it in <operator>
        puts "\n#{operator}"
      elsif ele.match(/\d+/) #if the element is a constant
        puts "\n#{ele}"
        case operator #apply the constant to <total> via <operator>
        when "+"
          total += ele.to_i
        when "-"
          total -= ele.to_i
        when "/"
          total /= ele.to_i
        when "*"
          total *= ele.to_i
        end
      end
    end
    puts "\n="
    puts "\nFinal total: #{total}"
  end
end

def roll_dice (dice)
  #convert the numbers of dice and sides to Integers
  number = dice[0].to_i
  sides = dice[1].to_i

  case sides #roll the appropriate number of the appropriately sided die
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
  else
    puts "That is not a die used in Dungeons and Dragons. Please try again."
  end
end

dnd_dice
