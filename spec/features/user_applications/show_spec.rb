require 'rails_helper'

describe 'New Application' do
  describe "When I visit an applications show page '/applications/:id'" do
    it "Then I can see the following: Name of the User on the Application, 
    Full Address of the User on the Application, Description of why the applicant 
    says they'd be a good home for this pet(s), names of all pets that this 
    application is for (all names of pets should be links to their show page), 
    The Application's status, either 'In Progress', 'Pending', 'Accepted', or 'Rejected'" do
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
            
      visit "/applications/#{application.id}"

      expect(page).to have_content(application.name)
      expect(page).to have_content(application.address)
      expect(page).to have_content(application.city)
      expect(page).to have_content(application.state)
      expect(page).to have_content(application.zip)
      expect(page).to have_content(application.description)
      expect(page).to have_content(application.status)



    end
  end
end