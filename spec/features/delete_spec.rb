require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a shelter show page' do
    it 'Then I see a link to delete the shelter' do
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_link('Delete Shelter')
    end
  end
end
