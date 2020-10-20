class Pet <ApplicationRecord
  belongs_to :shelter

  has_many :user_applications, through: :pet_applications


  def self.pet_approved?(pet)
    apps = PetApplication.where(pet_id: pet)
    apps.any? { |app| app.status == 'Approve' }
  end
end
