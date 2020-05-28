require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Magic Johnson', username: 'mjohnson')
  end

  it 'Is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Is not valid if new user -name- has fewer characters than 5' do
    subject.name = 'Magi'
    expect(subject).to_not be_valid
  end

  it 'Is not valid if new user -name- has more characters than 35' do
    subject.name = 'Magic Johnson Magic Johnson Magic Johnson Magic Johnson'
    expect(subject).to_not be_valid
  end

  it 'Is not valid if new user -username- has fewer characters than 3' do
    subject.username = 'ma'
    expect(subject).to_not be_valid
  end

  it 'Is not valid if new user -username- has more characters than 15' do
    subject.username = 'magicjohnsonmagic'
    expect(subject).to_not be_valid
  end
end
