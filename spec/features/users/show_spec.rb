require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a User's show page" do
    it "Then I see all that User's information Including the User's Name, Street Address, City, State, Zip" do
      user_1 = User.create(name: 'Mike',
                           address: '123 ABC St.',
                           city: 'Denver',
                           state: 'CO',
                           zip: '12345')

      visit "/users/#{user_1.id}"
      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_1.address)
      expect(page).to have_content(user_1.city)
      expect(page).to have_content(user_1.state)
      expect(page).to have_content(user_1.zip)
    end
  end
end
