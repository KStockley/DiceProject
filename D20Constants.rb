require "./DieClass.rb"

#generate the standard set of dice for the D20 roller
D4 = Die.new 4
D6 = Die.new 6
D8 = Die.new 8
D10 = Die.new 10
D12 = Die.new 12
D20 = Die.new 20
D100 = Die.new 100

#help documents for the D20 roller
TUTORIAL = <<HELP
\nUSAGE: Enter in the sequence of dice and/or modifiers you wish to calculate separated by spaces
         DICE: [number of dice]d[number of sides]
         MODIFIERS: [positive integer]
         OPERATORS: [+, -, /, *]

EXAMPLE: "3d6 + 2d8 - 6"\n

SEE ALSO: dice\n
HELP

DICE_HELP = <<HELP
\nThe D20 system uses the following dice: d4, d6, d8, d10, d12, d20, and d100\n
HELP
