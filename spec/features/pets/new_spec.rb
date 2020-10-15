require 'rails_helper'

describe "As a visitor" do
  describe 'When I visit a Shelter Pets Index page' do
    describe "Then I see a link to add a new adoptable pet for that shelter 'Create Pet'
    When I click the link" do
      it "I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
      When I fill in the form with the pet's: image, name, description, approximate age, sex ('female' or 'male')" do
        shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                   address: '123 ABC Street',
                                   city: 'Denver',
                                   state: 'Colorado',
                                   zip: '12345')
        pet_1 = Pet.create(image: 'lib/assets/test_image',
                           name: 'Test_dog',
                           age: 5,
                           sex: 'male',
                           shelter_id: shelter_1.id.to_s,
                           description: 'test description',
                           status: 'Adoptable')
        visit "/shelters/#{shelter_1.id}/pets/new"
        find_field('pet[image]').value
        find_field('pet[name]').value
        find_field('pet[description]').value
        find_field('pet[age]').value
        find_field('pet[sex]').value
        fill_in 'pet[name]', with: 'Test Pet'
      end
      describe "And I click the button 'Create Pet'" do
        it "Then a `POST` request is sent to '/shelters/:shelter_id/pets',
          a new pet is created for that shelter,
          hat pet has a status of 'adoptable',
          and I am redirected to the Shelter Pets Index page where I can see the new pet listed" do
          shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                     address: '123 ABC Street',
                                     city: 'Denver',
                                     state: 'Colorado',
                                     zip: '12345')
          pet_1 = Pet.create(image: 'lib/assets/test_image',
                             name: 'Test_dog',
                             age: 5,
                             sex: 'male',
                             shelter_id: shelter_1.id.to_s,
                             description: 'test description',
                             status: 'Adoptable')
          visit "/shelters/#{shelter_1.id}/pets/new"
          fill_in 'pet[name]', with: 'Test Pet'
          click_button 'Add Pet'
          expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
          expect(page).to have_content(pet_1.name)
        end
      end
    end
  end
end
