require 'rails_helper'

RSpec.describe 'User', type: :feature do
  it 'is not a valid sign up if the email exists in the database' do
    visit new_user_path
    fill_in 'user_name', with: 'Sergio Mauricio Zambrano'
    fill_in 'user_username', with: 'sergiomauz'
    find("input[type='submit']").click

    expect(page).not_to have_content('You are signed up. Now you can sign in!')
  end

  it 'is valid sign in if redirected page have a successful message' do
    visit root_path
    fill_in 'user_username', with: 'sergiomauz'
    find("input[type='submit']").click

    expect(page).to have_content('You are signed in!')
  end

  it 'is valid sign up if redirected page have a successful message' do
    visit new_user_path
    fill_in 'user_name', with: 'Selene Perez'
    fill_in 'user_username', with: 'selene'
    find("input[type='submit']").click

    expect(page).to have_content('You are signed up. Now you can sign in!')
  end
end
