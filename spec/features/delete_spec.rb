require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a shelter show page' do
    it "Then I see a link to delete the shelter, and When I click the link 'Delete Shelter',
    Then a 'DELETE' request is sent to '/shelters/:id',
    the shelter is deleted,
    and I am redirected to the shelter index page where I no longer see this shelter" do
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      visit "/shelters/#{shelter_1.id}"
      expect(find('#delete_button').value).to have_content('Delete Shelter')
      find('#delete_button').click
      expect(current_path).to eq("/shelters")
      expect(page).to !have_content('Dumb Friends League')
    end
  end
end
