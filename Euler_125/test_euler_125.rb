require "Test/Unit"

require_relative "Euler_125"

class Test_Integer < Test::Unit::TestCase
	TEST_CASES = { 12321 => true,
								 12322 => false,
								 98211289 => true,
								 1 => true,
								 54321 => false}

	def test_is_palin
		TEST_CASES.each{|input, output| assert_equal(output, input.is_palin?)}
	end

	TEST_CONS_SEQUENCES = { 3 => [[1] , [1, 2] , [1 , 2, 3] , [2], [2 , 3] , [3]],
												  4 => [[1] , [1, 2] , [1 , 2, 3] , [1,2,3,4], [2], 
												  	    [2 , 3] , [2, 3, 4] , [3] , [3, 4], [4]]}
	
	def test_cons_sequences
		TEST_CONS_SEQUENCES.each{|input, output| assert_equal(output, input.cons_sequences)}		
	end

	# TEST_CONS = { 1000 => false,
	# 							595 => true,
	# 					    594 => false}

	# def test_is_sum_of_cons_squares
	# 	TEST_CONS.each{|input, output| assert_equal(output, input.is_sum_of_cons_squares)}		
	# end
end

class Test_Array < Test::Unit::TestCase
	TEST_CASES = { [6, 7, 8, 9, 10, 11, 12] => 595,
								 [1, 2, 3] => 14}

	def test_square
		TEST_CASES.each{|input, output| assert_equal(output, input.square)}		
	end
end

class Test_Euler_125 < Test::Unit::TestCase
	def setup
		@euler_125 = Euler_125.new
	end

	def test_find_cons_square_palins_under
		assert_equal([5, 55, 77, 181, 313, 434, 505, 545, 595, 636, 818 ],@euler_125.find_cons_square_palins_under(1000))
	end

	def test_sum
		assert_equal(4164, @euler_125.find_cons_square_palins_under(1000).inject(:+))
		assert_equal(20268, @euler_125.find_cons_square_palins_under(10000).inject(:+))
		assert_equal(272059, @euler_125.find_cons_square_palins_under(50000).inject(:+))
		assert_equal(2906969179, @euler_125.find_cons_square_palins_under(10**8).inject(:+))
	end
end