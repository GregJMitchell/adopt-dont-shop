class User < ApplicationRecord
  has_many :reviews
  has_many :user_applications

  def average_rating
    reviews.average(:rating)
  end

  def best_review
    (Review.where(rating: Review.maximum("rating")))[0]
  end

  def worst_review
    (Review.where(rating: Review.minimum("rating")))[0]
  end
end
