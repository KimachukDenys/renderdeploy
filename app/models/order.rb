class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items

  # Валідатори для обов'язкових полів
  validates :name, :email, :phone, :delivery_method, :payment_method, :city, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+?\d{10,15}\z/, message: "має бути у форматі міжнародного номера" }
  validates :warehouse_name, presence: true
end
