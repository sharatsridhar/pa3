class Maze

	def initialize (n, m)
		@row = n
		@column = m
	end

	def load(arg)
		@maze = arg.split("")
	end

	def display
		row = 1
		charsum = ""
		@maze.each do |char|
			charsum += char
			char = char.to_i
			if row.odd?
				if charsum.length.odd? && char == 1
					print "+"
				elsif charsum.length.even? && char == 1
					print "-"
				else
					print " "
				end
			elsif row.even?
				if char == 1
					print "|"
				else
					print " "
				end
			end
			if charsum.length % 9 == 0
				row += 1
				print "\n"
			end
		end

	end

end

ah_maze_ing = Maze.new 9,9
ah_maze_ing.load "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
ah_maze_ing.display