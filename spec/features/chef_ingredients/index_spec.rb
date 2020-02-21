require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'When I Visit a Chefs Ingredient Index page' do
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

			visit "/chefs/#{@meg.id}/ingredients"

			expect(current_path).to eq("/chefs/#{@meg.id}/ingredients")
		end

		it 'I can see a unique list of names of all the ingredients that this chef uses' do

			expect(page).to have_content(@shell.name)
			expect(page).to have_content(@beef.name)
			expect(page).to have_content(@sour_cream.name)
			expect(page).to have_content(@sausage.name)
			expect(page).to have_content(@noodles.name)
			expect(page).to have_content(@sauce.name)
		end
	end
end
