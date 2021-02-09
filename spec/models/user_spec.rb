require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'creates a new user' do
      @user = User.create(
        name: 'Colin E',
        email: 'coline@gmail.com',
        password: 'pilot1995',
        password_confirmation: 'pilot1995'
        )
        expect(@user).to be_valid
    end

    it 'fails to create a new user with passwords that do not match' do
      @user = User.create(
        name: 'Colin E',
        email: 'coline@gmail.com',
        password: 'pilot1995',
        password_confirmation: 'pilot50'
        )
        @user.should_not be_valid
    end

    it 'fails to create a new user with an empty password field' do
      @user = User.create(name: 'Colin E', email: 'coline@gmail.com')
      @user.should_not be_valid
    end
  end

end