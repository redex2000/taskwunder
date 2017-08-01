require 'rails_helper'

feature 'Sign up users', %q{
  In order to get access to site content
  As a guest
  I want to be able to register
} do

  before { visit sign_up_path }

  scenario 'valid info is given' do
    within '#new_user' do
      fill_in 'Email', with: 'test@mail.ru'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      fill_in 'Full name', with: 'Test of the test'
      fill_in 'Birth date', with: Date.today - 20.years
      fill_in 'Bio', with: 'Once upon a time...'
      click_on 'Sign up'
    end
    within '.alert-success' do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
    expect(page).to have_content 'Welcome to our site!'
    expect(page).to have_link 'Sign out'
  end

  scenario 'invalid info is given' do
    within '#new_user' do
      fill_in 'Password', with: '1234'
      fill_in 'Password confirmation', with: '123'
      fill_in 'Full name', with: 'Test of the test'
      fill_in 'Birth date', with: Date.today - 20.years
      click_on 'Sign up'
    end
    within '.alert-danger' do
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password confirmation doesn't match Password"
      expect(page).to have_content "Password is too short (minimum is 8 characters)"
      expect(page).to have_content "Bio can't be blank"
    end
  end


end