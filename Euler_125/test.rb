(1..10).each do |x|
	(1..10).each do |y|
		puts "x: #{x} y: #{y}"
		break if x * y > 20
		puts x * y
	end
end