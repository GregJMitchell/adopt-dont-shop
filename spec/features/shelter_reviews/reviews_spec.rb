require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a shelter's show page, I see a list of reviews for that shelter" do
    it "Each review will have:title, rating, content, an optional picture,
     the name of the user that wrote the review" do
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      user_1 = User.create(name: 'Mike',
                           address: '123 ABC St.',
                           city: 'Denver',
                           state: 'CO',
                           zip: '12345')
      review = Review.create(title: 'test title',
                             rating: 5,
                             content: 'Content of the review',
                             image: '',
                             username: user_1.name,
                             user_id: user_1.id,
                             shelter_id: shelter_1.id)
      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.content)
      expect(page).to have_content(review.username)
    end
  end
end
