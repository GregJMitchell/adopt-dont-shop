require 'rails_helper'

describe 'New Application' do
  describe "As a visitor, When I visit the pet index page" do
    describe "Then I see a link to Start an Application,When I click this link" do
      it "Then I am taken to the new application page where I see a form When I fill in this form with my user name (assuming I have already created a user in the system)" do
        
        visit "/applications/new"

        !find_field('application[name]').value
        !find_field('application[address]').value
        !find_field('application[city]').value
        !find_field('application[state]').value
        !find_field('application[zip]').value
        !find_field('application[description]').value
      end
      describe "When I click submit, Then I am taken to the new application's show page " do
        it "And I see my user listed along with all of my address information And I see an indicator that this application is 'In Progress'" do
          
          user_1 = User.create(name: 'Mike',
            address: '123 ABC St.',
            city: 'Denver',
            state: 'CO',
            zip: '12345')
          
          visit "/applications/new"

          fill_in 'application[name]', with: "Mike"
          fill_in 'application[address]', with: "123 ABC St."
          fill_in 'application[city]', with: "Denver"
          fill_in 'application[state]', with: "CO"
          fill_in 'application[zip]', with: "12345"
          fill_in 'application[description]', with: "testing"
          click_button 'Create Application'

          expect(current_path).to eq("/applications/#{UserApplication.all.last.id}")
          expect(page).to have_content("Mike")
          expect(page).to have_content("123 ABC St.")
          expect(page).to have_content("CO")
          expect(page).to have_content("Denver")
          expect(page).to have_content("12345")
          expect(page).to have_content("testing")
        end
      end
    end
  end
end
