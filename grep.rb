file_name = ARGV[0]
regex = ARGV[1]
unless file_name || regex
	puts "Fehler, zu wenig Argumente"
	exit
end

r = Regexp.new(regex)
File.open(file_name, "r").each_with_index do |line, index|
	puts "#{index}: #{line}" if line =~ r
end