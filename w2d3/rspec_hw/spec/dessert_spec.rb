require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new("cake", 5, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do 
		expect(cake.type).to eq("cake")
	end

    it "sets a quantity" do
		expect(cake.quantity).to eq(5)
	end

    it "starts ingredients as an empty array" do
		expect(cake.ingredients.empty?).to eq(true)
	end

    it "raises an argument error when given a non-integer quantity" do
		expect { Desert.new("cake", "a few bits", chef) }.to raise_error(ArgumentError)
	end
  end

  describe "#add_ingredient" do
	context "when an ingredient is added" do
		before(:each) do
			cake.add_ingredient("vanilla")
		end
		
		it "adds an ingredient to the ingredients array" do
			expect(cake.ingredients.last).to eq("vanilla")
		end
	end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  end

  describe "#eat" do
	context "when a desert is eaten" do
		before(:each) do
			cake.eat(1)
		end
		
		it "subtracts an amount from the quantity" do
			expect(cake.quantity).to eq(4)
		end
	end
	
    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
