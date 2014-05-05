require 'spec_helper'

describe User do

  describe 'email' do

    it 'should not be empty' do
      user = FactoryGirl.build(:user, email: nil)
      user.should_not be_valid
    end

  end

end
