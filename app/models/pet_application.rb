class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :user_application
end
