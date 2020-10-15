require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a User's show page" do
    it "Then I see all that User's information Including the User's Name, Street Address, City, State, Zip" do
      user_1 = User.create(name: 'Mike',
                           address: '123 ABC St.',
                           city: 'Denver',
                           state: 'CO',
                           zip: '12345')

      visit "/users/#{user_1.id}"
      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_1.address)
      expect(page).to have_content(user_1.city)
      expect(page).to have_content(user_1.state)
      expect(page).to have_content(user_1.zip)
    end

    it "Should show user all of their reviews" do
      shelter = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      user_1 = User.create(name: 'Mike',
                           address: '123 ABC St.',
                           city: 'Denver',
                           state: 'CO',
                           zip: '12345')
      review = Review.create(title: 'Pets',
                             rating: 5,
                             content: 'Adorable',
                             username: 'Mike',
                             image: '',
                             shelter_id: shelter.id,
                             user_id: user_1.id)

      visit "/users/#{user_1.id}"
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.content)
    end
  end
end
