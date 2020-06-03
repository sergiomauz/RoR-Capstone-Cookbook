require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:user) { User.first }
  let(:store) { Store.first }
  let(:ingredient) { user.ingredients.new(name: 'Carrots', amount: 5.50, store_id: store.id) }

  it 'Is valid with valid attributes' do
    expect(ingredient).to be_valid
  end

  it 'Is not valid if new ingredient -name- has fewer characters than 3' do
    ingredient.name = 'Ca'
    expect(ingredient).to_not be_valid
  end

  it 'Is not valid if new ingredient -name- has more characters than 35' do
    ingredient.name = 'Carrots planted in the North Pole by Santa Claus'
    expect(ingredient).to_not be_valid
  end

  it 'Is not valid if new ingredient -amount- is less or equal to 0' do
    ingredient.amount = 0
    ingredient.name = 'Carrots'
    expect(ingredient).to_not be_valid
  end

  it 'Is not valid if new ingredient -amount- is higher than 9999.99' do
    ingredient.amount = 10_000
    expect(ingredient).to_not be_valid
  end
end
