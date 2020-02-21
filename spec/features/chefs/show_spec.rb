require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'When I visit a Chef show page.' do
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

			visit "/chefs/#{@meg.id}"

			expect(current_path).to eq("/chefs/#{@meg.id}")
		end

		it 'I see the name of that chef And I see a link to view a list of all ingredients that this chef uses in their dishes' do

			expect(page).to have_content(@meg.name)

			expect(page).to have_link("Ingredients")
		end

		it 'I click on the link to Ingredients and I am taken to a chefs ingredient index page ' do

			click_on "Ingredients"

			expect(current_path).to eq("/chefs/#{@meg.id}/ingredients")
		end
	end
end
