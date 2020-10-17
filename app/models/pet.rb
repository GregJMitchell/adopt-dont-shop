class Pet <ApplicationRecord
  belongs_to :shelter

  has_many :applications, through: :application_pets
end