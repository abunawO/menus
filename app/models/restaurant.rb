class Restaurant < ActiveRecord::Base
  has_many :menus
  has_many :menu_items, through: :menus

  validates :name, presence: true
end