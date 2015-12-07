input = File.open("day_5.in", "r")
total = 0

input.readlines.each do |line|
	if line =~ /([a-z]{2,}).*\1/ && line =~ /([a-z]).\1/
		total+=1
  end
end

puts total
