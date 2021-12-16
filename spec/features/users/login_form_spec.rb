require 'rails_helper'

RSpec.describe 'Log In Form' do
  before do
    visit register_path
    fill_in 'Name', with: 'User 1'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Create User'

    @user = User.last
  end

  it 'can log in a user' do
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button

    expect(current_path).to eq(user_path(@user))
  end

  it 'handles incorrect password' do
    visit login_path
    fill_in :email, with: @user.email
    fill_in :password, with: 'wrong'
    click_button

    expect(current_path).to eq(login_path)
  end

  it 'handles incorrect email' do
    visit login_path
    fill_in :email, with: 'noob'
    fill_in :password, with: @user.password
    click_button

    expect(current_path).to eq(login_path)
  end
end
