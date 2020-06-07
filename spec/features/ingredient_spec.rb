require 'rails_helper'

RSpec.describe 'Ingredient', type: :feature do
  before(:each) do
    visit root_path
    fill_in 'user_username', with: 'sergiomauz'

    find("input[type='submit']").click
  end

  it 'is a valid ingredient if the name has [3, 35] characters and the amount is [0.01, 9999.99]' do
    visit new_ingredient_path
    fill_in 'ingredient_name', with: 'Caviar'
    fill_in 'ingredient_amount', with: '50'
    find("input[type='submit']").click

    expect(page).to have_content('Ingredient created!')
  end

  it 'is not a valid ingredient if the name does not have [3, 35] characters or the amount is not [0.01, 9999.99]' do
    visit new_ingredient_path
    fill_in 'ingredient_name', with: 'Ca'
    fill_in 'ingredient_amount', with: '-50'
    find("input[type='submit']").click

    expect(page).not_to have_content('Ingredient created!')
  end

  it 'is a valid updated ingredient if the page has a successful message' do
    Ingredient.create(name: 'Tomatoes', amount: 5, author_id: User.first.id, store_id: Store.first.id)
    visit edit_ingredient_path(Ingredient.first)
    first('#ingredient_group_id option:first-of-type').select_option
    find("input[type='submit']").click

    expect(page).to have_content('Ingredient updated!')
  end
end
