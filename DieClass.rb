class Die
	def initialize (sides = 6)
		unless (sides.is_a?(Integer) && sides > 0)
			raise ArgumentError, "You can only roll a die with a positive whole number of sides"
		end

		@sides = sides
	end

	def roll (num = 1, show = true)
		unless (num.is_a?(Integer) && num > 0)
			raise ArgumentError, "You can only roll a positive number of whole dice"
		end

		results = []

		# roll the requested number of dice
		num.times { |i| results << rand(@sides) + 1 }

    # display the individual die results and the total
    if show
    	show_results(results)
    end

		results.sum
	end

	def show_results (results) # log die results if requested (default)
		if results.size > 1
			puts "\nDice results: #{results.join(" ")}"
		else
			puts "Die result: #{results.join(" ")}"
		end
		puts "Total: #{results.sum}\n\n"
	end
end
