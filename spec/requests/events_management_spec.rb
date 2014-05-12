require 'spec_helper'

describe 'Events Management' do

  # implement when user model created
  before :each do 
    @event = FactoryGirl.create(:event)
    @event_attributes = FactoryGirl.attributes_for(:event, name: "Party")
    ApplicationController.any_instance.stub(:current_user).and_return(@event.user)
  end

  describe 'new event path' do

    it 'returns 200 status' do
      get '/events/new'
      expect(response.status).to eq(200)
    end 

    it "renders form for new event" do
      get '/events/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'index path' do 

    it 'returns 200 status' do
      get '/events'
      expect(response.status).to eq(200)
    end

    it 'lists all events' do
      get '/events'
      expect(response.status).to render_template(:index)
    end
  end

  describe 'creating a new event' do

    it 'renders a form and creates a new event' do
      get '/events/new'
      expect(response).to render_template(:new)

      post "/events", event: @event_attributes

      expect(response).to redirect_to("/events")
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Party")
    end

  end  

end







