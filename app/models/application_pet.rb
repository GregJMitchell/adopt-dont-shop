class ApplicationPet < ApplicationRecord
  has_many :pets
  has_many :user_applications
end