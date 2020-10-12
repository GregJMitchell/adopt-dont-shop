require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit '/users/new' I see a form to create a new user" do
    it 'When I fill in the form with my Name, Street Address, City, State, Zip' do
      visit '/users/new'
      !find_field('user[name]').value
      !find_field('user[address]').value
      !find_field('user[city]').value
      !find_field('user[state]').value
      !find_field('user[zip]').value
    end
    it "Then I am taken to my new user's show page And I see all of the information I entered in the form" do
      user_1 = User.create(name: 'Mike',
                           address: '123 ABC St.',
                           city: 'Denver',
                           state: 'CO',
                           zip: '12345')
      visit '/users/new'
      fill_in 'user[name]', with: user_1.name
      fill_in 'user[address]', with: user_1.address
      fill_in 'user[city]', with: user_1.city
      fill_in 'user[state]', with: user_1.state
      fill_in 'user[zip]', with: user_1.zip
      find('#submit_button').click
      expect(current_path).to eq("/users/#{user_1.id}")
      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_1.address)
      expect(page).to have_content(user_1.city)
      expect(page).to have_content(user_1.state)
      expect(page).to have_content(user_1.zip)
    end
  end
end
