#!/usr/bin/env ruby
require "./DieClass.rb"

# generate the standard set of dice for Dungeons and Dragons
D4 = Die.new 4
D6 = Die.new 6
D8 = Die.new 8
D10 = Die.new 10
D12 = Die.new 12
D20 = Die.new 20

def rolling
  system("clear")

  while true
    puts "Enter the dice to be rolled (3d6 for example) or 'exit': "
    input = gets.split("d") # parse out the x and y from xdy

    if input[0] == "exit\n" # check for exit condition
      return
    end

    # convert the numbers of dice and sides to Integers
    number = input[0].to_i
    sides = input[1].to_i

    case sides
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
    	puts "That is an invalid type of die. Please try again."
    end
  end
end

rolling
