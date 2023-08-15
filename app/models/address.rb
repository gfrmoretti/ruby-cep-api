class Address < ApplicationRecord
  validates :cep, presence: true
  validates :uf, presence: true
  validates :city, presence: true
  validates :neighborhood, presence: false
  validates :street, presence: false

  has_and_belongs_to_many :users
end