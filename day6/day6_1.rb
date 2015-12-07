require "set"

input = File.open("day6.in", "r")
display = Array.new(1000*1000, 0)
brightness = 0

input.readlines.each do |line|
	words = line.split(" ")

	# Choose the right command
	if words[0].eql? "toggle"
		pos_start = words[1].split(",")
		pos_end = words[3].split(",")

		for x in pos_start[0].to_i..pos_end[0].to_i
			for y in pos_start[1].to_i..pos_end[1].to_i
				# Toggle == increase brightness by 2
				display[x + (1000*y)]+=2
				brightness+=2
			end
		end
	elsif words[1].eql? "on"
		pos_start = words[2].split(",")
		pos_end = words[4].split(",")

		for x in pos_start[0].to_i..pos_end[0].to_i
			for y in pos_start[1].to_i..pos_end[1].to_i
				# Turn on == increase brightness by 1
				display[x + (1000*y)]+=1
				brightness+=1
			end
		end
	elsif words[1].eql? "off"
		pos_start = words[2].split(",")
		pos_end = words[4].split(",")

		for x in pos_start[0].to_i..pos_end[0].to_i
			for y in pos_start[1].to_i..pos_end[1].to_i
				# Turn off == decrease brightness by 1 to a min of 0
				if display[x + (1000*y)] >= 1
					display[x + (1000*y)]-=1
					brightness-=1
				end
			end
		end
	end
end

puts brightness


# turn off 675,351 through 675,836
# toggle 918,857 through 944,886
