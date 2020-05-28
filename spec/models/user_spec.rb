require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Magic Johnson', username: 'mjohnson') }

  it 'Is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'Is not valid if new user -name- has fewer characters than 5' do
    user.name = 'Magi'
    expect(user).to_not be_valid
  end

  it 'Is not valid if new user -name- has more characters than 35' do
    user.name = 'Magic Johnson Magic Johnson Magic Johnson Magic Johnson'
    expect(user).to_not be_valid
  end

  it 'Is not valid if new user -username- has fewer characters than 3' do
    user.username = 'ma'
    expect(user).to_not be_valid
  end

  it 'Is not valid if new user -username- has more characters than 15' do
    user.username = 'magicjohnsonmagic'
    expect(user).to_not be_valid
  end
end
