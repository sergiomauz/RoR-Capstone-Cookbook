require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Group.new(name: 'Stew', icon: 'https://somedomain.com/icon.png') }

  it 'Is valid if new group has valid attributes' do
    expect(group).to be_valid
  end

  it 'Is not valid if new group -name- has fewer characters than 3' do
    group.name = 'St'
    expect(group).to_not be_valid
  end

  it 'Is not valid if new group -name- has more characters than 35' do
    group.name = 'Stew with chicken, cow, rabit, pork and turkey'
    expect(group).to_not be_valid
  end

  it 'Is not valid if new group -icon- is NULL' do
    group.name = 'Stew'
    group.icon = nil
    expect(group).to_not be_valid
  end
end
