input = File.open("day8.in", "r")
total_original = 0
total_encoded = 0

input.readlines.each do |line|
  total_original+=(line.length-1)

  # Don't count the \n for each line (-1), but add in both quotes (+2)
  total_encoded+=(line.length+1)

  for i in 0..line.length-1
    if (line[i].eql? "\"") || (line[i].eql? "\\")
      total_encoded+=1
    end
  end
end

puts total_encoded - total_original
