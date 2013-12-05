require_relative "../lib/grid.rb"
require_relative "../lib/cell.rb"

describe Grid do 

	context "initialization" do 
		let (:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'} #easy puzzle row by row

		let (:grid) {Grid.new(puzzle)}


		
				#creates a new grid with the puzzle inside it by default

		it "should have 81 cells by default" do 
			expect(grid.cells.count).to eq(81)
			end       
				#this should be a initialize method because this will never change, it will always have 81 cells by default

		it "first cell should be unsolved" do 
			expect(grid.cells.first).to eq (0)
			end		
				#look at the 'puzzle' string, the first element in the array has a value '0', therfore is is unsolved

		it "second cell should have a value of 1" do 
			expect(grid.cells[1]).to eq (1)	
			end			
				#the second cell in the puzzle has a value of '1' therefore the value is '1'

		it "should puts the cells into rows" do 
			expect(grid.row.length).to eq (9)
			end	

		it "should put the cells into collums" do 
			expect(grid.columns.length).to eq (9)
			end	

		it "should know which row my cell is in" do 
			expect(grid.which_row(40)).to eq 4
			end

		it "should know which column my cell is in" do 
			expect(grid.which_column(40)).to eq 4	
			end		

		it "should know which box a cell in in" do 
			expect(grid.which_box(27)).to eq 3
			end		

		it "should know which box row a box is in" do
			expect(grid.which_box_row(34)).to eq 1	
			end

		it "should know which collumn box a box is in"do
			expect(grid.which_box_collumn(41)). to eq 1
			end 			


		it "should expect the first box to hold the first 3 elements of the first 3 rows." do
			expect(grid.first_box_values).to eq [0,1,5,0,0,0,2,7,0]
		end

			



		end
end


