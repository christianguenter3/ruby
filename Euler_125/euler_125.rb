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

	@@square_memo = {}

	def is_sum_of_cons_squares
		sq = (Math.sqrt(self)).to_i
		if @@square_memo.has_key?(self)
			puts "#{self} => via Memo"
			return true
		end
		(1..sq).each do |x| 
			(x..sq).each do |y| 
				arr = (x..y).to_a
				square = arr.square
				if square == self && arr.length > 1
					puts "#{self} => #{arr}"
					return true 
				elsif arr.length > 1 && square.is_palin?
					@@square_memo[square] = true
				end
			end
		end
		#puts @@square_memo
		return false
	end		
end

class Array	
	@@memo = {}

	def square
		self.inject(0) { |mem, var| mem + ( var * var)}			
	end
end

class Euler_125
	def find_cons_square_palins_under(limit)
		result = []
		(1..limit).each do |x| 
			next unless x.is_palin?
			if x.is_sum_of_cons_squares
				result << x
			end
		end
		return result
	end
end