class Pet <ApplicationRecord
  belongs_to :shelter

  has_many :user_applications, through: :pet_applications
end
