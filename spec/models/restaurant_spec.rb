require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'validations' do
    it 'should be valid with valid attributes' do
      restaurant = Restaurant.new(name: 'Poppo\'s Cafe')
      expect(restaurant).to be_valid
    end

    it 'should be invalid without a name' do
      restaurant = Restaurant.new
      expect(restaurant).to be_invalid
    end
  end

  context 'relationships' do
    it 'should have many menus' do
      restaurant = Restaurant.create!(name: 'Poppo\'s Cafe')
      menu = Menu.create!(name: 'Lunch', restaurant: restaurant)
      expect(restaurant.menus).to include(menu)
    end

    it 'should have many menu items through menus' do
      restaurant = Restaurant.create!(name: 'Poppo\'s Cafe')
      menu = Menu.create!(name: 'Lunch', restaurant: restaurant)
      MenuItem.create!(name: 'Burger', price: 9.00, menu: menu)
      expect(restaurant.menu_items).to include(MenuItem.first)
    end
  end
end