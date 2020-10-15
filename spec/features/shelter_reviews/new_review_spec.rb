require 'rails_helper'

describe 'As a visitor' do
    describe 'When I visit /shelters/:id' do
        it "should have a link to add a new review for this shelter" do
            shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                       address: '123 ABC Street',
                                       city: 'Denver',
                                       state: 'Colorado',
                                       zip: '12345')
      
            visit "/shelters/#{shelter_1.id}"
            expect(page).to have_link('Add Review')
            find('#add_review').click
            expect(current_path).to eq("/shelters/#{shelter_1.id}/reviews/new")
            !expect(find_field('review[title]').value)
            find('.ratings')
            !expect(find_field('review[content]').value)
            !expect(find_field('review[username]').value)
            !expect(find_field('review[image]').value)
          end
      
          it "should create new review" do
            shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                       address: '123 ABC Street',
                                       city: 'Denver',
                                       state: 'Colorado',
                                       zip: '12345')
            user_1 = User.create(name: 'Jose',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      
            visit "/shelters/#{shelter_1.id}/reviews/new"
            fill_in 'review[title]', with: 'Pets'
            find("#review_rating_1").click
            fill_in 'review[content]', with: 'Pets Look cute'
            select(user_1.name, from: 'review[username]')
            fill_in 'review[image]', with: 'lib/assets/test_image'
            click_button 'Create Review'
            expect(current_path).to eq("/shelters/#{shelter_1.id}")
            expect(page).to have_content('Pets')
            expect(page).to have_content('5')
            expect(page).to have_content('Pets Look cute')
            # expect(page).to have_content('Jose')
            expect(page).to have_xpath("//img[contains(@src,'lib/assets/test_image')]")
          end
    end
end