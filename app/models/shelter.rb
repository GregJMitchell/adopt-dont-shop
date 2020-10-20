class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  def average_review_rating
    reviews.average(:rating)
  end

  def count_applications
    user_names = users.map do |user|
      user.name
    end
    UserApplication.where(name: user_names).count
  end
end
