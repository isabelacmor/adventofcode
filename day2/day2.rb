input = File.open("day2.in", "r")

total = 0
ribbon = 0

input.readlines.each do |line|
	# Process present
	*measurements = line.split("x").map(&:to_i)
	measurements = measurements.sort()
	area = 0
	smallest = 99999
	volume = 1

	for i in 0..measurements.length-1
		area += (2 * measurements[i % measurements.length] * measurements[(i+1) % measurements.length])
		smallest = [smallest, measurements[i % measurements.length] * measurements[(i+1) % measurements.length]].min
		volume *= measurements[i]
	end

	area += smallest
	total += area

	ribbon += (2*measurements[0] + 2*measurements[1]) + volume
end

puts "Total wrapping paper area: #{total}"
puts "Total ribbon length: #{ribbon}"
