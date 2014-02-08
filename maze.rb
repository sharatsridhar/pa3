class Maze

	def initialize (n, m)
		@r = n
		@c = m
	end

	def load(arg)
		@maze = arg.split("")
		@matrix = Array.new

		count = 0
		@r.times do |r|
			@matrix[r] = Array.new
			@c.times do |c|
				@matrix[r][c] = (@maze[count]).to_i
				print @matrix[r][c]
				count += 1
			end
			print "\n"
		end
		# @matrix[3][1] = 0

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
			if charsum.length % @r == 0
				row += 1
				print "\n"
			end
		end

	end

	def solve(bX, bY, eX, eY)
		visited = Array.new
		queue = Array.new
		path = Array.new

		
		start = [bX, bY]
		finish = [eX, eY]
		
		queue.push(start)
		while !queue.empty?
			cur = queue.pop()
			path.push(cur)
			if compareTuple(cur, finish)
				puts "You're out!"
				puts "The path you followed is: "
				path.each do |x, y|
					print "[#{y},#{x}] "
				end
				#puts path.inspect
				return true
			end
			trace(cur).each do |next_el|
				if !visited.include? next_el
					queue.push(next_el)
					visited.push(next_el)
				end
			end
			#print visited.last
		end
    end


    def compareTuple(t1, t2)
    	if t1[0] == t2[0] && t1[1] == t2[1]
    		return true
    	end
    	return false
    end

    def trace(loc)
    	potential = Array.new

    	x = loc[0]
    	y = loc[1]
    	#puts "loc"
    	#puts loc.inspect
    	#can we go up
    	if x-1 > 0 && @matrix[x-1][y] != 1
    		potential.push([x-1, y])
    		#puts "Go up"
    	end
    	#can we go down
    	if x+1 < @c+1 && @matrix[x+1][y] != 1
    		potential.push([x+1, y])
    		#puts "Go down"

    	end
    	#can we go left
    	if y-1 > 0 && @matrix[x][y-1] != 1
    		potential.push([x, y-1])
    		#puts "Go left"

    	end
    	#can we go right
    	if y+1 < @r+1 && @matrix[x][y+1] != 1
    		potential.push([x, y+1])
    		#puts "Go right"
    	end
    	return potential
    end

end


my_maze = Maze.new(9, 9)
my_maze.load "111111111100010001111010101100010101101110101100000101111011101100000101111111111"
my_maze.display
my_maze.solve(1,1, 7, 7)
