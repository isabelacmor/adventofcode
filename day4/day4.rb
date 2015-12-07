require 'digest/md5'

input = "yzbqklnj"

cur = 0
valid = false
loop do
	# Go to next hash
	cur+=1

	# Create the MD5 hash
	hash = Digest::MD5.hexdigest(input + "#{cur}")
	
	#puts input + "#{cur} : #{hash}"
	
	# Break if valid
	break if hash[0..5] == "000000"	
end

puts cur
