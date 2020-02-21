require 'rails_helper'

RSpec.describe Ingredients, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :name}
		it {should validate_presence_of :calories}
	end

	describe 'Relationships' do
		it {should have_many :dish_ingredients}
		it {should have_many(:dishes).through(:dish_ingredients)}
	end
end
