require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /shelters' do
    it 'Then I see the name of each shelter in the system' do
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
    end
    it "Then I see a link to create a new Shelter, 'New Shelter'" do
      visit '/shelters'
      expect(page).to have_link('New Shelter')
    end
  end
end
