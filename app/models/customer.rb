class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validates :email, uniqueness: true, format:{
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: 'invalid email'
  }

  validates :name, :presence => true
  validates :lastname, :presence => true

end
