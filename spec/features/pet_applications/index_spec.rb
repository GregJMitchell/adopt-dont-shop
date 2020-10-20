require 'rails_helper'

describe "As a visitor" do
    it "When I visit a pets show page I see a link to view all applications for this pet" do
        shelter_1 = Shelter.create(name: 'Dumb Friends League',
            address: '123 ABC Street',
            city: 'Denver',
            state: 'Colorado',
            zip: '12345')
    pet_1 = Pet.create(image: 'lib/assets/test_image',
        name: 'Test_dog',
        age: 5,
        sex: 'male',
        shelter_id: shelter_1.id.to_s)

    visit "/pets/#{pet_1.id}"
    
    expect(page).to have_link("All Applications")
    end
    describe "When I click that link" do 
        it "I can see a list of all the names of applicants for this pet Each applicants name is a link to the application's show page" do
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
  
  
                application = UserApplication.create!(name: "Jose", address: "", city: "", state: "", zip:"",
                      description: "", status: "", user_id: user_1.id)
  
                      PetApplication.create(pet_id: pet_1.id, user_application_id: application.id)
        visit "/pets/#{pet_1.id}"

        click_on "All Applications"
        
        expect(current_path).to eq("/pets/#{pet_1.id}/applications")

        expect(page).to have_content("Jose")
        expect(page).to have_link("Jose")
        click_on "Jose"
        expect(current_path).to eq("/applications/#{application.id}")
        end
        it "When I visit a pet applications index page for a pet that has no applications on them I see a message saying that there are no applications for this pet yet"do 
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

            visit "/pets/#{pet_1.id}/applications"

            expect(page).to have_content("There are no applications for this pet yet")
            expect(page).not_to have_link("Jose")
        end
    end
end