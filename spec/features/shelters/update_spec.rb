require 'rails_helper'

describe "When I click the link 'Update Shelter'" do
  it "Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's
    data including: name, address, city, state, zip" do
    shelter_1 = Shelter.create(name: 'Dumb Friends League',
                               address: '123 ABC Street',
                               city: 'Denver',
                               state: 'Colorado',
                               zip: '12345')
    visit "/shelters/#{shelter_1.id}/edit"
    expect(find_field('shelter[name]').value).to have_content(shelter_1.name)
    expect(find_field('shelter[address]').value).to have_content(shelter_1.address)
    expect(find_field('shelter[city]').value).to have_content(shelter_1.city)
    expect(find_field('shelter[state]').value).to have_content(shelter_1.state)
    expect(find_field('shelter[zip]').value).to have_content(shelter_1.zip)
    fill_in 'shelter[name]', with: 'Test Shelter'
    click_button 'Update Shelter'
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content('Test Shelter')
  end
end
