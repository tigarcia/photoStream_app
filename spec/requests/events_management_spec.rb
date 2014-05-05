require 'spec_helper'

describe 'Events Management' do

  # implement when user model created
  # before :each do 
  #   @event = FactoryGirl.create(:event)
  #   @event_attributes = FactoryGirl.attributes_for(:event, name: "Party")
  #   ApplicationController.any_instance.stub(:current_user).and_return(@event.user)
  # end

  describe 'root path/new' do

    it 'returns 200 status' do
      get '/'
      expect(response.status).to eq(200)
    end

    it "renders form for new event" do
      get '/'
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

  # describe 'editing an event' do

  #   it 'should update the event in database' do
  #     get 'events/#{@event.id}/edit'

  #     expect(response.body).to include("")
  #   end
  # end

end