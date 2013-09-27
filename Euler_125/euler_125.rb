class Integer
	def is_palin?
		self == self.to_s.reverse.to_i
	end

	def cons_sequences
		result = []
		(1..self).to_a.each do |x| 
			result << (x..self).to_a 
			(x..self).to_a.each { |y| result << (x..y).to_a }
		end
		return result.sort.uniq
	end

	def is_sum_of_cons_squares
		(1..self).to_a.each do |x| 
			return true if (x..self).to_a.square == self
			(x..self).to_a.each { |y| return true if (x..y).to_a.square == self }
		end
		return false
	end
end

class Array
	def square
		self.inject(0) { |mem, var| mem + ( var * var)}	
	end
end

class Euler_125
	def find_cons_square_palins_under(limit)
		result = []
		(1..limit).to_a.each do |x| 
			next unless x.is_palin?
			puts x
			if x.is_sum_of_cons_squares
				puts "match: #{x}"
				result << x
			end
		end
	end
end