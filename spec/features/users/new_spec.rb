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
  end
end
