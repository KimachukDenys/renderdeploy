class User < ApplicationRecord
  has_many :orders
  # Підключення Devise для автентифікації
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  # Валідації
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+380\d{9}\z/, message: "must be a valid phone number" }

  def admin?
    role == 'admin'
  end
end
