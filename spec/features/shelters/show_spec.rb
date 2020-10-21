require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /shelters/:id' do
    it 'Then I see the shelter with that id including the shelters: name, address, city, state, zip,
      Then I see a link to update the shelter "Update Shelter"' do
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')

      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content("Address: #{shelter_1.address}")
      expect(page).to have_content("City: #{shelter_1.city}")
      expect(page).to have_content("State: #{shelter_1.state}")
      expect(page).to have_content("Zipcode: #{shelter_1.zip}")
      expect(page).to have_link('Edit Shelter')
    end

    it 'should have a link to add a new review for this shelter' do
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
    it "I see statistics for that shelter, including: count of pets that are at that shelter, 
    average shelter review rating, number of applications on file for that shelter" do
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
          shelter_1 = Shelter.create(name: 'Dumb Friends League',
            address: '123 ABC Street',
            city: 'Denver',
            state: 'Colorado',
            zip: '12345')
          pet_1 = Pet.create(image: 'lib/assets/test_image',
              name: 'Test_dog',
              age: 5,
              sex: 'male',
              shelter_id: shelter_1.id)

              review = Review.create(title: 'test title',
                rating: 5,
                content: 'Content of the review',
                image: '',
                username: user_1.name,
                user_id: user_1.id,
                shelter_id: shelter_1.id)
        application = UserApplication.create!(name: "Jose", address: "", city: "", state: "", zip:"",
              description: "", status: "", user_id: user_1.id)

              PetApplication.create(pet_id: pet_1.id, user_application_id: application.id)
      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_content("Number of Pets: 1")
      expect(page).to have_content("Average Rating: 5")
      expect(page).to have_content("Number of Applications: 1")
    end
    it "If a shelter doesn't have any pets with an approved application I can delete that shelter" do
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
         
          pet_1 = Pet.create(image: 'lib/assets/test_image',
              name: 'Test_dog',
              age: 5,
              sex: 'male',
              shelter_id: shelter_1.id)


        application = UserApplication.create!(name: "Jose", address: "", city: "", state: "", zip:"",
              description: "", status: "", user_id: user_1.id)

              PetApplication.create(pet_id: pet_1.id, user_application_id: application.id, status: "rejected")

        visit "/shelters/#{shelter_1.id}"

        expect(shelter_1.pets[0]).to eq(pet_1)

        click_button "Delete Shelter"
        
        expect(current_path).to eq("/shelters")
    end
  end
end
