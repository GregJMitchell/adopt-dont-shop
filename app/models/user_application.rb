class UserApplication < ApplicationRecord
  belongs_to :user
  
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.find_pets(name)
    Pet.where(name: name).all
  end
end
