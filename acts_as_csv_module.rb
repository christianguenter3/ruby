module ActsAsCsv
	def self.included(base)	
		base.extend ClassMethods
	end

	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			puts "Test"
			puts self.class.to_s.downcase
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		attr_accessor :headers, :csv_contents

		def initialize
			read
		end

		def each(&block)
			@csv_contents.each do |row|
				block.call CsvRow.new(@headers, row)
			end
		end
	end
end

class CsvRow
	def initialize(header, row)
		@headers = header
		@row = row
	end

	def method_missing name, *args
		@row[@headers.index(name.to_s)]
	end

	def to_s
		@row
	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect

csv.each{|row| puts row.to_s}
csv.each{|row| puts row.two}