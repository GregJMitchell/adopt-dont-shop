class Application < ApplicationRecord
  belongs_to :user
  
  has_many :pets, through: :application_pets
end