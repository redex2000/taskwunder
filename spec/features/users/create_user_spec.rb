require 'rails_helper'

feature 'Create user', %q{
  In order to get new clients
  As a admin
  I want to be able to create user
} do

  given(:admin) { create(:admin) }
  given!(:user) { build(:user) }

  before {
    sign_in admin
    visit new_user_path
  }

  scenario 'valid info is given' do
    within '#new_user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      fill_in 'Full name', with: user.full_name
      fill_in 'Bio', with: user.bio
      find('#user_birth_date_1i').text('2017')
      find('#user_birth_date_2i').select('July')
      find('#user_birth_date_3i').text('21')
      attach_file 'Avatar', Rails.root.join('spec/fixtures/logo.png')
      click_on 'Create User'
    end
    within '.alert-success' do
      expect(page).to have_content 'User created successfully!'
    end
    within '.table' do
      expect(page).to have_link user.email
    end
    click_on 'Sign out'
    sign_in user
    expect(page).to have_content 'Welcome to our site!'
  end

end