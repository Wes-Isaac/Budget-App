require 'rails_helper'

RSpec.feature 'Group Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ali Raza', email: 'hello@example.com', password: 'password')
    @group = Group.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: @user.id)
    visit user_session_path
    fill_in 'user_email', with: 'hello@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    click_link('Shopping')
  end

  it 'Navigate to the show category' do
    expect(page).to have_current_path(group_path(@group))
  end

  it 'show Catgory Details heading' do
    expect(page).to have_content 'View Categories'
  end

  it 'show payment name' do
    expect(page).to have_content 'Please add a payment'
  end
end
