class Grid

	attr_reader :cells

	def initialize (initial_value)
			@cells = initial_value.split('').map { |i| i.to_i}	
	end

	def row
		rows = []
		cells.each_slice(9) {|row| rows << row}
		rows
	end

	def columns
		row.transpose
	end	

	def which_row(cell_number)
		cell_number % 9 
	end

	def which_column(cell_number)
		cell_number	% 9
	end




end