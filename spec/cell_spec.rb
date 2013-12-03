require_relative "../lib/cell.rb"

describe Cell do 
     
    let (:cell) {Cell.new}

    it "should be empty by default" do
    	expect(cell).to be_empty
    end

    it "should have a value" do
    	cell.value = 5
    	expect(cell.value).to eq 5
   	end

   	it "should not be empty if it has a value" do
   		cell.value = 4
   		expect(cell).not_to be_empty
   	end

   	it "should know it's possible values given all but one" do 
   		expect(cell).to be_empty
   		neighbours = [1,2,3,4,5,7,8,9]
   		expect(cell.possible_values(neighbours)).to eq [6]
 		end

 		it "should know it's possible values given all but two" do 
 			expect(cell).to be_empty
 			neighbours = [1,2,3,4,6,7,8]
 			expect(cell.possible_values(neighbours)).to eq [5,9]
 		end

   	it "it should solve itself if there is only one solution" do
   		neighbours = [1,2,3,4,6,7,8,9]
   		cell.solve(neighbours)
   		expect(cell.solve(neighbours)).to eq 5
   	end



	end