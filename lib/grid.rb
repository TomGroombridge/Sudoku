class Grid

	attr_reader :cells
	attr_accessor :box

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
		cell_number / 9 
	end

	def which_column(cell_number)
		cell_number	% 9
	end

	def which_box(cell_number)
		3 * (which_row(cell_number) /3) + (which_column(cell_number) /3)
	end

	def which_box_row(cell_number)
		which_row(cell_number) / 3
	end

	def which_box_collumn(cell_number)
		which_box(cell_number) / 3
	end

	def first_box_values
		row[0,3].map{|array| array.slice(0,3)}
		.flatten
	end

	# def box(n)
	# 	box(n) = Array.new
	# 	row[0]








end