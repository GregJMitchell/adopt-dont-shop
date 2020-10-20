class UserApplication < ApplicationRecord
  belongs_to :user

  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def self.find_pets(name)
    Pet.where('lower(name) like ?', "%#{name.downcase}%")
  end

  def self.find_pet_applications(application_id, pet_id)
    PetApplication.find_by(pet_id: pet_id, user_application_id: application_id)
  end

  def self.approved?(application_id)
    pet_apps = PetApplication.where(user_application_id: application_id)

    if pet_apps.any? { |pet_app| pet_app.status == 'Reject' }
      false
    elsif pet_apps.any? { |pet_app| pet_app.status.nil? }
      'pending'
    elsif pet_apps.all? { |pet_app| pet_app.status == 'Approve'}
      true
    end
  end

  def self.pet_application_approved?(pet)
    apps = PetApplication.where(pet_id: pet)
    apps.any? { |app| app.status == 'Approve' }
  end
end
