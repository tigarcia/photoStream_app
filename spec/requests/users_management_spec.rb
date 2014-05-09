require 'spec_helper'

describe 'Users Management' do

  before :each do
    subject {FactoryGirl.create(:user)}
  end

  describe "signing in" do

    # it 'should allow you to sign in with valid credentials' do
    #   post '/sessions/new'
    #   expect(response).to be_success
    # end

      # it "should not allow sign in with invalid credentials" do

      # end
  end

end

# TODO: work through rspec for signing in, out and creating new user. Qs: how does this interact with sessions? what is best way to use factory girl here?