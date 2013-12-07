class Grid

	attr_accessor :cells
	attr_accessor :box

	def initialize (initial_value)
			@cells = initial_value.split('').map { |i| i.to_i}	
	end

	def row
		rows = []
		cells.each_slice(9) {|row| rows << row}
		rows
	end

	#write a 
	def row_indexes 
		arr = []
		(0..80).to_a.each_slice(9){|a| arr << a}
		arr
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

	def first_box
		row[0..2].map{|array| array[0..2]}
		.flatten
	end

	def second_box
		row[0..2].map{|array| array[3..5]}
		.flatten
	end

	def forth_box
		row[3..5].map{|array| array[0..2]}
		.flatten
	end

	def box_indexes
		first_cell_indexes = [0,3,6,27,30,33,54,57,60]	
		box_coordinates = lambda {|i| [i, i + 1, i + 2, i + 9, i +10, i + 11, i + 18, i + 19, i +20]}
		first_cell_indexes.map &box_coordinates
	end

	def values(indexes)
		indexes.map {|index| @cells[index]}
	end

	def incomplete_values
		not_complete = []
		@cells.each_with_index do |value, index|
			not_complete << index if value == 0
		end
		not_complete
	end

	def neighbours(cell_number)
		return_array = []
		return_array << row_indexes[which_row(cell_number)]
		return_array << row_indexes.transpose[which_row(cell_number)]
		return_array << box_indexes[which_box(cell_number)]
		return_array.flatten.uniq
	end

	def neighbour_values (cell_number)
		values(neighbours(cell_number)).flatten.uniq.sort
	end

	def missing_values(cell_number)
		(0..9).to_a - neighbour_values(cell_number)
	end



end

