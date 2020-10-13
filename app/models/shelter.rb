class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
end
