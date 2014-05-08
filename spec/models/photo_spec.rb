require 'spec_helper'

describe Photo do

  it 'should respond to name and event_id' do
    photo = FactoryGirl.build(:photo)
    photo.should respond_to(:name)
    photo.should respond_to(:event_id)
  end

  it 'should have an event id' do
    photo = FactoryGirl.build(:photo, event_id: nil)
    photo.should_not be_valid
  end

end
