class UserApplication < ApplicationRecord
  belongs_to :user

  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.find_pets(name)
    pets = []
    Pet.all.each do |pet|
      if pet.name.upcase.include?(name.upcase)
        pets << Pet.where(name: "#{pet.name}").all
      end
    end
    pets.flatten
  end
end
