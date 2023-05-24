require 'rails_helper'

describe 'Log in', type: :feature do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  context 'when user is not registered' do
    let(:email) { 'not_existing@email.com' }
    let(:password) { 'password' }

    it 'displays error message' do # wszystkie capybarowe akcje wykonujemy w bloku it
      within '#new_user' do
        fill_in 'user_email',	with: email
        fill_in 'user_password',	with: password
        click_button 'Log in'
      end

      expect(page).to have_content('Invalid Email or password.')
    end
  end

  context 'when user is registered' do
    let(:user) {User.create(email: email, password: password )}
    let(:email) { 'existing@email.com' }
    let(:password) { 'password' }

    it 'logs in' do
      within '#new_user' do
        fill_in 'user_email',	with: user.email
        fill_in 'user_password',	with: user.password
        click_button 'Log in'
      end

      expect(page).to have_content('Signed in successfully.')
    end
  end
end
