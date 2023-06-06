require 'rails_helper'

RSpec.describe Menu, type: :model do
  context 'validations' do
    it 'should be valid with valid attributes' do
      menu = Menu.new(name: 'Lunch')
      expect(menu).to be_valid
    end

    it 'should be invalid without a name' do
      menu = Menu.new
      expect(menu).to be_invalid
    end

    it 'should be invalid with a duplicate name' do
      Menu.create!(name: 'Lunch')
      menu = Menu.new(name: 'Lunch')
      expect(menu).to be_invalid
    end
  end

  context 'relationships' do
    it 'should have many menu items' do
      menu = Menu.new(name: 'Lunch')
      expect(menu.menu_items).to be_empty

      menu_item = MenuItem.create(name: 'Burger', price: 9.00, menu: menu)
      expect(menu.menu_items).to include(menu_item)
    end

    it 'should belong to a restaurant' do
      restaurant = Restaurant.create(name: "Poppo's Cafe")
      menu = Menu.new(name: 'Lunch', restaurant: restaurant)
      expect(menu.restaurant).to eq(restaurant)
    end
  end
end