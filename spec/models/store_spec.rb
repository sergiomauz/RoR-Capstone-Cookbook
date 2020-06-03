require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { Store.new(name: 'Amazon') }

  it 'Is valid with valid attributes' do
    expect(store).to be_valid
  end

  it 'Is not valid with valid attributes' do
    store.name = 'Am'
    expect(store).to_not be_valid
  end
end
