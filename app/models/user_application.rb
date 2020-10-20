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

  def self.find_pet_applications(application_id, pet_id)
    PetApplication.find_by(pet_id: pet_id, user_application_id: application_id)
  end
end
