require 'rails_helper'

describe 'As a visitor' do
    describe "When I visit a shelter's show page I see a link to edit the shelter review next to each review." do 
        describe "When I click on this link, I am taken to an edit shelter review path" do
          it "On this new page, I see a form that includes that review's pre populated data: title, rating, content, image, the name of the user that wrote the review" do
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
              expect(page).to have_link("Edit Review")
              click_link("Edit Review")
              expect(current_path).to eq("/reviews/#{review.id}/edit")
          end
        end
    end
end