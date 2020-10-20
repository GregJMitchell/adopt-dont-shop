require 'rails_helper'

RSpec.describe UserApplication do
  describe 'relationships' do
    it {should have_many :pet_applications}
    it { should have_many(:pets).through(:pet_applications) }
  end
  it "Should be able to get pet_applications" do
    user_1 = User.create(name: 'Jose',
        address: '123 ABC Street',
        city: 'Denver',
        state: 'Colorado',
        zip: '12345')
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                      address: '123 ABC Street',
                      city: 'Denver',
                      state: 'Colorado',
                      zip: '12345')
      pet_1 = Pet.create(image: 'lib/assets/test_image',
              name: 'Test_dog',
              age: 5,
              sex: 'male',
              shelter_id: shelter_1.id)

      application = UserApplication.create!(name: '', address: '', city: '', state: '', zip: '',
                                description: '', status: '', user_id: user_1.id)
      pet_app = PetApplication.create(pet_id: pet_1.id, user_application_id: application.id)

      expect(UserApplication.find_pet_applications(application.id, pet_1.id)).to eq(pet_app)
  end
  it "Can find pets based on name" do 
    user_1 = User.create(name: 'Jose',
        address: '123 ABC Street',
        city: 'Denver',
        state: 'Colorado',
        zip: '12345')
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                      address: '123 ABC Street',
                      city: 'Denver',
                      state: 'Colorado',
                      zip: '12345')
      pet_1 = Pet.create(image: 'lib/assets/test_image',
              name: 'Test_dog',
              age: 5,
              sex: 'male',
              shelter_id: shelter_1.id)

      application = UserApplication.create!(name: '', address: '', city: '', state: '', zip: '',
                                description: '', status: '', user_id: user_1.id)
    expect(UserApplication.find_pets(pet_1.name)).to eq([pet_1])
  end
  it "can tell if an application is approved" do
    user_1 = User.create(name: 'Jose',
        address: '123 ABC Street',
        city: 'Denver',
        state: 'Colorado',
        zip: '12345')
      shelter_1 = Shelter.create(name: 'Dumb Friends League',
                      address: '123 ABC Street',
                      city: 'Denver',
                      state: 'Colorado',
                      zip: '12345')
      pet_1 = Pet.create(image: 'lib/assets/test_image',
              name: 'Test_dog',
              age: 5,
              sex: 'male',
              shelter_id: shelter_1.id)

      pet_2 = Pet.create(image: 'lib/assets/test_image',
                name: 'Test_dog',
                age: 5,
                sex: 'male',
                shelter_id: shelter_1.id)

      application = UserApplication.create!(name: '', address: '', city: '', state: '', zip: '',
                                description: '', status: 'In Progress', user_id: user_1.id)
      PetApplication.create(pet_id: pet_1.id, user_application_id: application.id, status: nil)
      PetApplication.create(pet_id: pet_2.id, user_application_id: application.id, status: "Approve")

      expect(UserApplication.approved?(application.id)).to eq("pending")
  end
end
