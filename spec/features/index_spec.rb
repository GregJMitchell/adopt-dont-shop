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
                         shelter_id: shelter_1.id.to_s)

      visit '/pets'
      expect(page).to have_xpath("//img[contains(@src,'#{pet_1.image}')]")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content("Age: #{pet_1.age}")
      expect(page).to have_content("Sex: #{pet_1.sex}")
      expect(page).to have_content("Current Shelter Name: #{pet_1.shelter.name}")
      expect(page).to have_xpath("//img[contains(@src,'#{pet_2.image}')]")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content("Age: #{pet_2.age}")
      expect(page).to have_content("Sex: #{pet_2.sex}")
      expect(page).to have_content("Current Shelter Name: #{pet_2.shelter.name}")
    end
  end
  describe 'When I visit the pets index page or a shelter pets index page Next to every pet, I see a link to delete that pet' do
    it 'When I click the link I should be taken to the pets index page where I no longer see that pet' do
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
          visit '/pets'
      find('#delete_button').click
      expect(current_path).to eq('/pets')
      expect(page).not_to have_content(pet_1.name)
    end
  end
end
