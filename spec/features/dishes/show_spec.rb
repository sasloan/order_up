require 'rails_helper'

RSpec.describe 'As a Visitor' do
	describe 'When I visit a Dish show page' do
		before :each do
			@meg = Chef.create!(name: "Master Chef Meg")
			@taco = @meg.dishes.create!(name: "Taco", description: "Crunchy taste latin treat")
			@shell = Ingredients.create!(name: "Taco Shell", calories: 20)
			@beef = Ingredients.create!(name: "Beef", calories: 60)
			@sour_cream = Ingredients.create!(name: "Sour Cream", calories: 50)

			visit "/dishes/#{@taco.id}"

			expect(current_path).to eq("/dishes/#{@taco.id}")
		end

		it 'I see the name of the chef that made that dish And I see a list of ingredients for that dish' do

			expect(page).to have_content(@taco.name)
			expect(page).to have_content(@meg.name)

			within "#ingredients" do
				expect(page).to have_content(@shell.name)
				expect(page).to have_content(@shell.calories)
				expect(page).to have_content(@beef.name)
				expect(page).to have_content(@beef.calories)
				expect(page).to have_content(@sour_cream.name)
				expect(page).to have_content(@sour_cream.calories)
			end
		end
	end
end
