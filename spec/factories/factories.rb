# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :event do
    name "New Event"
    event_date "20140607"
  end

  factory :photo do
    name "Image"
    
  end

end
