class User < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end
end