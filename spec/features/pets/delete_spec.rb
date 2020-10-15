require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a pet show page Then I see a link to delete the pet 'Delete Pet' " do
    it "When I click the link,Then a 'DELETE' request is sent to '/pets/:id'" do
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
      visit "/pets/#{pet_1.id}"
      find('#delete_pet').click
      expect(current_path).to eq("/pets")
      expect(page).not_to have_content(pet_1.name)
    end
  end
end
