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
    find('#submit_button').click
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content('Test Shelter')
  end
end

describe 'As a visitor, When I visit a Pet Show page' do
  describe "Then I see a link to update that Pet 'Update Pet'" do
    describe 'When I click the link' do
      it "I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
      image, name, description, approximate age, sex" do
        shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                   address: '123 ABC Street',
                                   city: 'Denver',
                                   state: 'Colorado',
                                   zip: '12345')
        pet_1 = Pet.create(image: 'lib/assets/test_image',
                           name: 'Test_dog',
                           age: 5,
                           sex: 'male',
                           shelter_id: shelter_1.id.to_s,
                           description: 'test description',
                           status: 'Adoptable')
        visit "/pets/#{pet_1.id}/edit"
        expect(find_field('pet[name]').value).to have_content(pet_1.name)
        expect(find_field('pet[image]').value).to have_content(pet_1.image)
        expect(find_field('pet[age]').value).to have_content(pet_1.age)
        expect(find_field('pet[sex]').value).to have_content(pet_1.sex)
        expect(find_field('pet[description]').value).to have_content(pet_1.description)
      end
    end
  end
end
