require 'rails_helper'

describe 'New Application' do
  describe 'As a visitor, When I visit the pet index page' do
    describe 'Then I see a link to Start an Application,When I click this link' do
      it 'Then I am taken to the new application page where I see a form When I fill in this form with my user name (assuming I have already created a user in the system)' do
        visit '/applications/new'

        !find_field('application[name]').value
       
      end
      describe "When I click submit, Then I am taken to the new application's show page " do
        it "And I see my user listed along with all of my address information And I see an indicator that this application is 'In Progress'" do
          user_1 = User.create(name: 'Mike',
                               address: '123 ABC St.',
                               city: 'Denver',
                               state: 'CO',
                               zip: '12345')

          visit '/applications/new'

          fill_in 'application[name]', with: 'Mike'
         

          click_button 'Create Application'

          expect(current_path).to eq("/applications/#{UserApplication.all.last.id}")
          expect(page).to have_content('Mike')
          expect(page).to have_content('123 ABC St.')
          expect(page).to have_content('CO')
          expect(page).to have_content('Denver')
          expect(page).to have_content('12345')
        end
        it 'When I fail to enter a valid username, I am returned to the new application page and flashed a message' do
          visit '/applications/new'

          fill_in 'application[name]', with: 'Mike'

          click_button 'Create Application'
          expect(page).to have_content('Application not created: Username not found.')
        end
      end
    end
  end
end
