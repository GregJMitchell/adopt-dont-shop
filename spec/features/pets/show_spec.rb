require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets'" do
    it "Then I see each Pet that can be adopted from that
      Shelter with that shelter_id including the Pet's: image, name, approximate age, and sex" do
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                                 address: '123 ABC Street',
                                 city: 'Denver',
                                 state: 'Colorado',
                                 zip: '12345')
      pet_1 = Pet.create(image: 'lib/assets/test_image',
                         name: 'Test_dog',
                         age: 5,
                         sex: 'male',
                         shelter_id: shelter_1.id.to_s)

      pet_2 = Pet.create(image: 'lib/assets/test2_image',
                         name: 'Test_dog_2',
                         age: 10,
                         sex: 'felmale',
                         shelter_id: 1)
      visit "/shelters/#{shelter_1.id}/pets"
      expect(page).to have_xpath("//img[contains(@src,'#{pet_1.image}')]")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content("Age: #{pet_1.age}")
      expect(page).to have_content("Sex: #{pet_1.sex}")
    end
  end
  describe "When I visit '/pets/:id'" do
    it "Then I see the pet with that id including
    the pet's:, image, name, description, approximate age, sex, adoptable/pending adoption status" do
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
      expect(page).to have_xpath("//img[contains(@src,'#{pet_1.image}')]")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content("Age: #{pet_1.age}")
      expect(page).to have_content("Sex: #{pet_1.sex}")
      expect(page).to have_content("Description: #{pet_1.description}")
      expect(page).to have_content("Adoptable/Pending Status: #{pet_1.status}")
    end
  end

end
