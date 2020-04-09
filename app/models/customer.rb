class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validates :email, uniquness: true, format:{
      with: %r{/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i},
      message: 'invalid email'
  }

  validates :name, allow_blank:false
  validates :lastname, allow_blank:false

end
