require 'rails_helper'

RSpec.describe 'Store', type: :feature do
  before(:each) do
    visit root_path
    fill_in 'user_username', with: 'sergiomauz'
    find("input[type='submit']").click
  end

  it 'is a valid store if has [3, 35] characters' do
    visit new_store_path
    fill_in 'store_name', with: 'eBuy'
    find("input[type='submit']").click

    expect(page).to have_content('Store created!')
  end

  it 'is a valid store if has [3, 35] characters' do
    visit edit_store_path(Store.last)
    fill_in 'store_name', with: 'eBuy Fast'
    find("input[type='submit']").click

    expect(page).to have_content('Store updated!')
  end

  it 'is not a valid store if has more than 35 characters' do
    visit new_store_path
    fill_in 'store_name', with: 'Buy a lot of things here, the best store in the world'
    find("input[type='submit']").click

    expect(page).not_to have_content('Store created!')
  end

  it 'is not a valid store if has less than 3 characters' do
    visit new_store_path
    fill_in 'store_name', with: 'eB'
    find("input[type='submit']").click

    expect(page).not_to have_content('Store created!')
  end
end
