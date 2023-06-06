module ApplicationHelper

  def import_restaurant_data(json_data)
    restaurants = JSON.parse(json_data)['restaurants']
  
    logs = []
    success = true
  
    restaurants.each do |restaurant_data|
      restaurant = Restaurant.find_or_create_by(name: restaurant_data['name'])
      logs << "Successfully found or created restaurant #{restaurant.name}"
  
      restaurant_data['menus'].each do |menu|
        menu_name = menu['name']
        menu_items = menu['menu_items'] || menu['dishes']
  
        menu_obj = Menu.find_or_create_by(name: menu_name, restaurant: restaurant)
        logs << "Successfully found or created menu #{menu_obj.name}"
  
        menu_items&.each do |menu_item|
          begin
            menu_item_obj = MenuItem.find_or_initialize_by(
              name: menu_item['name'],
              menu: menu_obj
            )
            menu_item_obj.price = menu_item['price']
            menu_item_obj.save!
            logs << "Successfully created menu item #{menu_item_obj.name}"
          rescue ActiveRecord::RecordInvalid => e
            logs << "Failed to create menu item #{menu_item['name']}: #{e.message}"
            success = false
          end
        end
      end
    end
  
    logs.each { |log| puts log } # Print logs for debugging
  
    return logs, success
  end  

end