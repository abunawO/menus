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
end