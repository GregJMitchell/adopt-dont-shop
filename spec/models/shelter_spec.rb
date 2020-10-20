require 'rails_helper'

describe Shelter do
  describe 'relationships' do
    it {should have_many :pets}
    it {should have_many(:users).through(:reviews)}
  end

  describe "As a visitor" do
    describe "If a shelter has approved applications for any of their pets" do
      it "Can not delete that shelter" do
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

        application = UserApplication.create!(name: '', address: '', city: '', state: '', zip: '', description: '', status: 'In Progress', user_id: user_1.id)

        PetApplication.create(pet_id: pet_1.id, user_application_id: application.id, status: nil)
        PetApplication.create(pet_id: pet_2.id, user_application_id:
            application.id, status: "Approve")

        expect(Shelter.application_approved?(shelter_1)).to eq(true)
      end
    end
  end
end
