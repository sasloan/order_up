require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
  end

	describe 'Instance Methods' do
		before :each do
			@meg = Chef.create!(name: "Master Chef Meg")
			@taco = @meg.dishes.create!(name: "Taco", description: "Crunchy taste latin treat")
			@shell = Ingredient.create!(name: "Taco Shell", calories: 20)
			@beef = Ingredient.create!(name: "Beef", calories: 60)
			@sour_cream = Ingredient.create!(name: "Sour Cream", calories: 50)
			@spagetti = @meg.dishes.create!(name: "Spagetti", description: "Tasty Pasta")
			@noodles = Ingredient.create!(name: "Noodles", calories: 80)
			@sausage = Ingredient.create!(name: "Sausage", calories: 120)
			@sauce = Ingredient.create!(name: "Sauce", calories: 20)

			@taco.ingredients << @shell
			@taco.ingredients << @beef
			@taco.ingredients << @sour_cream

			@spagetti.ingredients << @noodles
			@spagetti.ingredients << @sausage
			@spagetti.ingredients << @sauce
			@spagetti.ingredients << @beef
		end

		it '.total_calories' do
			expect(@taco.total_calories).to eq(130)
		end
	end
end
