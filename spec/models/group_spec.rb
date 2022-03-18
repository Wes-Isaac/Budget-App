require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'test for the equipment model should pass' do
    new_user = User.new(name: 'test', email: 'test@yahoo.com', password: '123456')
    Payment.new(user: new_user, name: 'Dinner', amount: 600)
    subject do
      Group.new
    end

    before { subject.save }

    it 'should be inavlid because text is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be inavlid because icon is nil' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid because name and icon are not nil' do
      subject.user = new_user
      subject.name = 'Food'
      subject.icon = 'icon0.png'
      expect(subject).to be_valid
    end

    it 'should be inavlid because name is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid because name is nil' do
      subject.user = new_user
      subject.name = 'Food'
      subject.icon = 'icon0.png'
      expect(subject).to be_valid
    end
  end
end
