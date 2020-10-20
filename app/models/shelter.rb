class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  def self.application_approved?(shelter)
    approved_bool = false
    shelter.pets.each do |pet|
      apps = PetApplication.where(pet_id: pet)
      approved_bool = true if apps.any? { |app| app.status == 'Approve' }
    end
    approved_bool
  end
end
