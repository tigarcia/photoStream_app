require 'spec_helper'

describe Event do

  it 'should respond to name and event_date' do
    event = FactoryGirl.build(:event)
    event.should respond_to(:name)
    event.should respond_to(:event_date)
  end

  describe 'event_date' do

    it 'should not be empty' do
      event = FactoryGirl.build(:event, event_date: nil)
      event.should_not be_valid
    end

    it 'should not be valid' do
      event = FactoryGirl.build(:event, event_date: "tomorrow")
      event.should_not be_valid
    end

    # it 'should be unique' do
    # TODO: date should only be unique when associated with event name.
    # end
  end

  describe 'name' do

    it 'should not be empty' do
      event = FactoryGirl.build(:event, name: nil)
      event.should_not be_valid
    end

    # it 'should not be unique' do
    # TODO: date should only be unique when associated with event name.
    # end
  end

end
