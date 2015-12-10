input = File.open("day8.in", "r")
total_characters = 0
total_memory = 0

input.readlines.each do |line|
  # Don't count the \n at the end of each line
  total_characters +=(line.length-1)

  # Don't count the beginning and end quotes
  total_memory+=(line.length-3)

  i = 0
  until i > line.length-1 do
    if line[i].eql? "\\"
      if (line[i+1].eql? "\"") || (line[i+1].eql? "\\")
        total_memory-=1
        i+=1
      else # Must be a hex encoding (\x--)
        total_memory-=3
        i+=3
      end
    end

    i+=1
  end
end

puts total_characters-total_memory
