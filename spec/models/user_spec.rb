require 'spec_helper'

describe User do

  describe 'email' do

    it 'should not be empty' do
      user = FactoryGirl.build(:user, email: nil)
      user.should_not be_valid
    end

    it 'should not be valid' do
      user = FactoryGirl.build(:user, email: "ghfghijo")
      user.should_not be_valid
    end

    it 'should be unique' do
      user = FactoryGirl.create(:user)
      user2 = FactoryGirl.build(:user, email: user.email)
      user2.should_not be_valid
    end

  end

  describe 'name' do

    it 'should not be empty' do
      user = FactoryGirl.build(:user, name: nil)
      user.should_not be_valid
    end
  end

  describe 'password' do
    it 'should match not be valid if it differs from password confirmation' do
      user = FactoryGirl.build(:user, password_confirmation: "hello")
      user.should_not be_valid
    end
  end

end
