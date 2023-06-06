class MenuItem < ActiveRecord::Base
  belongs_to :menu

  validates :name, presence: true, uniqueness: { scope: :menu_id }
  validates :price, presence: true, numericality: { greater_than: 0 }
end