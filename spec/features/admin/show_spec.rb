require "rails_helper"

describe "As a visitor" do 
  describe "When I visit an admin application show page ('/admin/applications/:id')" do
    it "For every pet that the application is for, I see a button to approve the application for that specific pet" do
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
  
  
        application = UserApplication.create!(name: "", address: "", city: "", state: "", zip:"",
              description: "", status: "", user_id: user_1.id)
        PetApplication.create(pet_id: pet_1.id, user_application_id: application.id)

        visit "/admin/applications/#{application.id}"
        expect(page).to have_button("Approve")
        expect(page).to have_button("Reject")
    end
    describe "When I click that button Then I'm taken back to the admin application show page" do
      describe "And next to the pet that I approved, I do not see a button to approve this pet" do 
        it "And instead I see an indicator next to the pet that they have been approved" do
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
      
      
            application = UserApplication.create!(name: "", address: "", city: "", state: "", zip:"",
                  description: "", status: "", user_id: user_1.id)
            PetApplication.create(pet_id: pet_1.id, user_application_id: application.id)
    
            visit "/admin/applications/#{application.id}"

            click_button "Approve"

            expect(page).not_to have_button("Approve")
            expect(page).not_to have_button("Reject")
            expect(page).to have_content("Approved")
        end
      end
    end
  end
end