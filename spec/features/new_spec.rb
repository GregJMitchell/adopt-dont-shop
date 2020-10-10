require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the Shelter Index page' do
    describe "Then I see a link to create a new Shelter, 'New Shelter'" do
      describe 'When I click the new shelter link' do
        describe "I am taken to '/shelters/new' where I  see a form for a new shelter" do
          it "When I fill out the form with a new shelter's:" do
            visit '/shelters/new'
            find_field('shelter[name]').value
            find_field('shelter[address]').value
            find_field('shelter[city]').value
            find_field('shelter[state]').value
            find_field('shelter[zip]').value
          end
          describe "And I click the button 'Create Shelter' to submit the form" do
            it "Then a `POST` request is sent to '/shelters', a new shelter is created,
              and I am redirected to the Shelter Index page where I see the new Shelter listed." do
              visit '/shelters/new'

              fill_in 'shelter[name]', with: 'Test Shelter'
              find('#submit_button').click
              expect(current_path).to eq('/shelters')
              expect(page).to have_content('Test Shelter')
            end
          end
        end
      end
    end
  end
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
          find('#submit_button').click
          expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
          expect(page).to have_content(pet_1.name)
        end
      end
    end
  end
end
