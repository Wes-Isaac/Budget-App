require 'rails_helper'

RSpec.describe Payment, type: :model do
  context 'test for the equipment model should pass' do
    new_user = User.new(name: 'test', email: 'test@yahoo.com', password: '123456')
    Group.new(user: new_user, name: 'Food', icon: 'icon0.png')
    subject do
      Payment.new
    end

    before { subject.save }

    it 'should be invalid because text is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid because text is nil' do
      subject.user = new_user
      subject.name = 'Food'
      subject.amount = 250
      expect(subject).to_not be_valid
    end

    it 'should be invalid because text is nil' do
      subject.user = new_user
      subject.name = 'Food'
      subject.amount = '-250'
      expect(subject).to_not be_valid
    end

    it 'should be invalid because text is nil' do
      subject.user = new_user
      subject.name = 'Food'
      subject.amount = -250
      expect(subject).to_not be_valid
    end
  end
end
