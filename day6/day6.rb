require "set"

input = File.open("day6.in", "r")
display = Array.new(1000*1000, 0)
lights_on = 0

input.readlines.each do |line|
	words = line.split(" ")

	# Choose the right command
	if words[0].eql? "toggle"
		pos_start = words[1].split(",")
		pos_end = words[3].split(",")

		for x in pos_start[0].to_i..pos_end[0].to_i
			for y in pos_start[1].to_i..pos_end[1].to_i
				# Light was off; turn it on
				if display[x + (1000*y)] == 0
					display[x + (1000*y)] = 1
					lights_on+=1
				# Light was on; turn it off
				else
					display[x + (1000*y)] = 0
					lights_on-=1
				end
			end
		end
	elsif words[1].eql? "on"
		pos_start = words[2].split(",")
		pos_end = words[4].split(",")

		for x in pos_start[0].to_i..pos_end[0].to_i
			for y in pos_start[1].to_i..pos_end[1].to_i
				# Light was off; turn it on (don't care about lights that were already on)
				if display[x + (1000*y)] == 0
					display[x + (1000*y)] = 1
					lights_on+=1
				end
			end
		end
	elsif words[1].eql? "off"
		pos_start = words[2].split(",")
		pos_end = words[4].split(",")

		for x in pos_start[0].to_i..pos_end[0].to_i
			for y in pos_start[1].to_i..pos_end[1].to_i
				# Light was on; turn it off (don't care about lights that were already off)
				if display[x + (1000*y)] == 1
					display[x + (1000*y)] = 0
					lights_on-=1
				end
			end
		end
	end
end

puts lights_on


# turn off 675,351 through 675,836
# toggle 918,857 through 944,886
