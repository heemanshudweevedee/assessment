require 'rails_helper'

RSpec.describe DetailsController, type: :controller do

    it 'Show all users details' do
        person = Person.create(name: "kiwi")
        detail = Detail.create(person_id: person.id, email: "kiwi@gmail.com")
        get :index, as: :json
        expect(response).to have_http_status(200)
    end

    it 'creates a new person detail' do
        person = Person.create(name: "jone")
        post :create, params: {detail: { email: 'jone@gmail.com', person_id: person.id }} 
        expect(response).to have_http_status(200)
    end

    it 'create person without email' do
        post :create, params: {detail: { email: '' }}
        expect(response).to have_http_status(422)
    end
end