class AddReviewsToShelters < ActiveRecord::Migration[5.2]
  def change
    add_reference :shelters, :review, foreign_key: true
  end
end
