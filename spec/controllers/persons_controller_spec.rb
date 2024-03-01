require 'spec_helper'
require 'rails_helper'

RSpec.describe PersonsController, type: :controller do
    # include ApiHelper
    before(:all) do
        people = Person.create(name: "abc")
        detail = Detail.create(email: "ak@gmail.com", person_id: people.id)
    end

    it 'should show people details' do
        get :index, as: :json
        expect(response).to have_http_status(200)
    end

    it 'creates a new person' do
        post :create, params: { name: 'joe' } 
        expect(response).to have_http_status(201)
    end

    it 'create person without name' do
        post :create, params: { person: { name: '' } }
        expect(response).to have_http_status(422)
    end

    it 'show person detail' do
        get :show_details, params: {person_id: people.id}
        expect(response).to have_http_status(200)
    end

    it 'show person not present' do
        get :show_details, params: {person_id: 75}
        expect(response).to have_http_status(404)
    end

end