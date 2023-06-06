require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#import_restaurant_data' do
    let(:json_data) { File.read('data/restaurant_data.json') }

    it 'imports restaurant data and creates menu items' do
      logs, success = import_restaurant_data(json_data)
      expect(success).to be true
      expect(logs).to include('Successfully created menu item Burger')
      expect(logs).to include('Successfully created menu item Small Salad')
      expect(logs).to include('Successfully created menu item Chicken Wings')
      expect(logs).to include('Successfully created menu item Large Salad')
      expect(logs).to include('Successfully created menu item Mega "Burger"')
      expect(logs).to include('Successfully created menu item Lobster Mac & Cheese')
    end
  end
end
