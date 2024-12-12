class Warehouse < ApplicationRecord
    has_many :orders
    validates :ref, presence: true, uniqueness: true
    validates :city_description, presence: true
    validates :description, presence: true
end
  