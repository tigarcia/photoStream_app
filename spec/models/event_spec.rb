require 'spec_helper'

describe Event do

  it 'should respond to name and event_date' do
    event = Event.create(name: "Bat Mitzvah", event_date: 20140510)
    event.should respond_to(:name)
    event.should respond_to(:event_date)
  end
end
