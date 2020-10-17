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
    
    application = UserApplication.create!(name: "Jose", address: "", city: "", state: "", zip:"",
      description: "", status: "", user_id: user_1.id)

      visit "/applications/#{application.id}"


    end
  end
end