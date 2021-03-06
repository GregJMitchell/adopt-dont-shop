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
  describe "When I visit a User's show page" do
    it "Then I see the average rating of all of their reviews" do
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
      review2 = Review.create(title: 'Pets',
          rating: 5,
          content: 'Adorable',
          username: 'Mike',
          image: '',
          shelter_id: shelter.id,
          user_id: user_1.id)
      review3 = Review.create(title: 'Pets',
          rating: 3,
          content: 'Adorable',
          username: 'Mike',
          image: '',
          shelter_id: shelter.id,
          user_id: user_1.id)
      review4 = Review.create(title: 'Pets',
          rating: 4,
          content: 'Adorable',
          username: 'Mike',
          image: '',
          shelter_id: shelter.id,
          user_id: user_1.id)


      visit "users/#{user_1.id}"

      expect(page).to have_content("Average Review of User: 4.25/5")
    end

    describe "Then I see a section for 'Highlighted Reviews'" do
      it "I see the review with the best rating that this user has written" do
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
            rating: 1,
            content: 'Adorable',
            username: 'Mike',
            image: '',
            shelter_id: shelter.id,
            user_id: user_1.id)
        review2 = Review.create(title: 'Pets',
            rating: 5,
            content: 'Adorable',
            username: 'Mike',
            image: '',
            shelter_id: shelter.id,
            user_id: user_1.id)
        review3 = Review.create(title: 'Pets',
            rating: 3,
            content: 'Adorable',
            username: 'Mike',
            image: '',
            shelter_id: shelter.id,
            user_id: user_1.id)
        review4 = Review.create(title: 'Pets',
            rating: 4,
            content: 'Adorable',
            username: 'Mike',
            image: '',
            shelter_id: shelter.id,
            user_id: user_1.id)

        visit "/users/#{user_1.id}"

        within "#highlighted-reviews" do
          expect(page).to have_content("Highlighted Reviews")
          expect(page).to have_content("Best Rating")
          expect(page).to have_content(review2.title)
          expect(page).to have_content(review2.rating)
          expect(page).to have_content(review2.content)

          expect(page).to have_content("Worst Rating")
          expect(page).to have_content(review.title)
          expect(page).to have_content(review.rating)
          expect(page).to have_content(review.content)
        end
      end
    end
  end
end
