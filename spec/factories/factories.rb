# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@email.com"
  end
  
  factory :event do
    name "New Event"
    event_date "20140607"
    user
  end

  factory :photo do
    name "Image"
    event
  end

  factory :user do
    name "Courtney"
    email
    password "password"
    password_confirmation "password"
  end

end
