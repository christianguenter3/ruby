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
		(1..sq).each do |x| 
			(x..sq).each do |y| 
				arr = (x..y).to_a
				square = arr.square
				break if square > self
				@@square_memo[square] = true if arr.length > 1 && square.is_palin?				
			end
		end
		return false
	end	

	def get_palins
		@@square_memo.select {|x| x.is_palin? && x < self}.map { |k, value| k }.sort.uniq
	end
end

class Array	
	def square
		self.inject(0) { |mem, var| mem + ( var * var)}			
	end
end

class Euler_125
	def find_cons_square_palins_under(limit)
		limit.is_sum_of_cons_squares
		limit.get_palins		
	end
end