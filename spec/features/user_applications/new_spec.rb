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
        !find_field('application[username]').value
      end
    end
  end
end
