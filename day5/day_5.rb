input = File.open("day_5.in", "r")
total = 0

input.readlines.each do |line|
	if line !~ /(ab|cd|pq|xy)/
		if line =~ /([^aeiou]*[aeiou]){3,}[^aeiou]*/
			for i in 97..122
				cur_char = i.chr
				regex = cur_char + cur_char
				if line =~ /#{regex}/
					total+=1
					break
				end
			end
		end
	end
end

puts total
