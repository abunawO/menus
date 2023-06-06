class Menu < ActiveRecord::Base
  has_many :menu_items

  validates :name, presence: true, uniqueness: { scope: :restaurant_id }

  belongs_to :restaurant
end

