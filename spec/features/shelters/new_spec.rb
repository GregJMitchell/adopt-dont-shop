require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the Shelter Index page' do
    describe "Then I see a link to create a new Shelter, 'New Shelter'" do
      describe 'When I click the new shelter link' do
        describe "I am taken to '/shelters/new' where I  see a form for a new shelter" do
          it "When I fill out the form with a new shelter's:" do
            visit '/shelters/new'
            find_field('shelter[name]').value
            find_field('shelter[address]').value
            find_field('shelter[city]').value
            find_field('shelter[state]').value
            find_field('shelter[zip]').value
          end
          describe "And I click the button 'Create Shelter' to submit the form" do
            it "Then a `POST` request is sent to '/shelters', a new shelter is created,
              and I am redirected to the Shelter Index page where I see the new Shelter listed." do
              visit '/shelters/new'

              fill_in 'shelter[name]', with: 'Test Shelter'
              click_button 'Create User'
              expect(current_path).to eq('/shelters')
              expect(page).to have_content('Test Shelter')
            end
          end
        end
      end
    end
  end
end
