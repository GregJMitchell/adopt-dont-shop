require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /shelters' do
    it "Then I see the name of each shelter in the system
    and Then I see a link to create a new Shelter, 'New Shelter'" do
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      shelter_2 = Shelter.create(name: 'Denver Animal Shelter',
                                 address: 'ABC 123 Ave',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')

      visit '/shelters'
      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
      expect(page).to have_link('New Shelter')
    end
  end
  describe "When I visit '/pets'" do 
    it "Then I see each Pet in the system including the Pet's: image, name, approximate age,
     sex, and name of the shelter where the pet is currently located" do
       visit '/pets'
       expect(page).to have_xpath("//img[contains(@src,'#{pet_1.image}')]")
       expect(page).to have_content(pet_1.name)
       expect(page).to have_content(pet_1.age)
       expect(page).to have_content(pet_1.sex)
       expect(page).to have_content(pet_1.shelter)

     end
  end
end
