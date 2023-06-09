require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  context 'validations' do
    it 'should be valid with valid attributes' do
      menu_item = MenuItem.new(name: 'Burger', price: 9.00)
      expect(menu_item).to be_valid
    end

    it 'should be invalid without a name' do
      menu_item = MenuItem.new
      expect(menu_item).to be_invalid
    end

    it 'should be invalid with a duplicate name' do
      MenuItem.create!(name: 'Burger', price: 9.00)
      menu_item = MenuItem.new(name: 'Burger', price: 9.00)
      expect(menu_item).to be_invalid
    end

    it 'should be invalid without a price' do
      menu_item = MenuItem.new(name: 'Burger')
      expect(menu_item).to be_invalid
    end

    it 'should be invalid with a negative price' do
      menu_item = MenuItem.new(name: 'Burger', price: -9.00)
      expect(menu_item).to be_invalid
    end
  end

  context 'relationships' do
    it 'should belong to a menu' do
      menu = Menu.create(name: 'Lunch')
      menu_item = MenuItem.new(name: 'Burger', price: 9.00, menu: menu)
      expect(menu_item.menu).to eq(menu)
    end
  end
end
