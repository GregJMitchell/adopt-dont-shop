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
      expect(page).to have_link("Edit Shelter")
    end
  end
end
