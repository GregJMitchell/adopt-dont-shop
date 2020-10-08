require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the Shelter Index page' do
    describe "Then I see a link to create a new Shelter, 'New Shelter'" do
      describe 'When I click this link' do
        describe "Then I am taken to '/shelters/new' where I  see a form for a new shelter" do
          it "Then I see a link to create a new Shelter, 'New Shelter'" do
            visit '/shelters/new'
            find_field('shelter[name]').value
            find_field('shelter[address]').value
            find_field('shelter[city]').value
            find_field('shelter[state]').value
            find_field('shelter[zip]').value
          end
        end
      end
    end
  end
end
