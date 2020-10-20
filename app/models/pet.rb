class Pet <ApplicationRecord
  belongs_to :shelter

  has_many :user_applications, through: :pet_applications

  def self.count_pets(shelter_id)
    Pet.where(shelter_id: shelter_id).count
  end
end
