require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  before(:each) do
    visit root_path
    fill_in 'user_username', with: 'sergiomauz'
    find("input[type='submit']").click
  end

  it 'is a valid group (recipe) if has [3, 35] characters and a photo' do
    visit new_group_path
    page.attach_file('group_image_file', Rails.root + 'test/fixtures/files/upload.jpg')
    fill_in 'group_name', with: 'Peruvian ceviche'
    find("input[type='submit']").click

    expect(page).to have_content('Recipe created!')
  end

  it 'is not a valid group (recipe) if it does not have a photo' do
    visit new_group_path
    fill_in 'group_name', with: 'Peruvian ceviche'
    find("input[type='submit']").click

    expect(page).not_to have_content('Recipe created!')
  end
end
