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
      expect(page).to have_content(pet_1.name)



    end
    describe "And that application has not been submitted," do
      it "Then I see a section on the page to Add a Pet to this Application
      In that section I see an input where I can search for Pets by name" do
      user_1 = User.create(name: 'Jose',
        address: '123 ABC Street',
        city: 'Denver',
        state: 'Colorado',
        zip: '12345')

          application = UserApplication.create!(name: "", address: "", city: "", state: "", zip:"",
                description: "", status: "", user_id: user_1.id)

        visit "/applications/#{application.id}"

        expect(page).to have_content("Add a Pet to this Application")
        !find_field('search[name]')
      end
      describe "When I fill in this field with a Pet's name And I click submit," do
        it "Then I am taken back to the application show page And under the search bar I see any Pet whose name matches my search" do
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


          visit "/applications/#{application.id}"

          fill_in 'search[name]', with: "Test_dog"
          click_button 'Search'

          expect(current_path).to eq("/applications/#{application.id}")
          expect(page).to have_content(pet_1.name)
        end
        describe "Then next to each Pet's name I see a button to 'Adopt this Pet' When I click one of these buttons" do
          it "Then I am taken back to the application show page And I see the Pet I want to adopt listed on this application" do
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


            visit "/applications/#{application.id}"

            fill_in 'search[name]', with: "Test_dog"
            click_button 'Search'

            expect(page).to have_button("Add Pet")

            click_button 'Add Pet'

            expect(application.pets[0]).to eq(pet_1)
          end
          describe "Then I see a section to submit my application" do
            describe "And in that section I see an input to enter why I would make a good owner for these pet(s)" do
              describe "When I fill in that input And I click a button to submit this application" do
                it "Then I am taken back to the application's show page
                And I see an indicator that the application is 'Pending'
                And I see all the pets that I want to adopt
                And I do not see a section to add more pets to this application" do
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


                    application = UserApplication.create!(name: "Jose", address: "123 ABC Street", city: "Denver", state: "CO", zip:"12345",
                          description: "test12", status: "In Progress", user_id: user_1.id)
                    PetApplication.create(pet_id: pet_1.id, user_application_id: application.id)


                  visit "/applications/#{application.id}"

                  expect(page).to have_content('Finalize your Application')
                  !find_field("Why would you make a good owner for these pet(s)?")
                  expect(page).to have_button("Submit Application")

                  fill_in "application[description]", with: "testing"
                  click_button "Submit Application"

                  expect(page).to have_content('Pending')
                  application.pets.each do |pet|
                    expect(page).to have_content(pet.name)
                  end
                  expect(page).not_to have_button('Add a Pet to this Application')
                end
              end
            end
          end
          describe "When I visit an application's show page And I have not added any pets to the application" do
            it "Then I do not see a section to submit my application" do
              user_1 = User.create(name: 'Jose',
                address: '123 ABC Street',
                city: 'Denver',
                state: 'Colorado',
                zip: '12345')

              application = UserApplication.create!(name: "Jose", address: "123 ABC Street", city: "Denver",
                                                    state: "CO", zip:"12345",
                                                    description: "test12", status: "In Progress", user_id: user_1.id)
              visit "/applications/#{application.id}"

              expect(page).not_to have_content("Finalize your Application")
            end
          end
        end
      end
    end
  end
end
