class PersonsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
        persons = Person.all
        if persons.present?
            render json: { status: { success: "Person loaded successfuly", data: persons} }, status: :ok and return
        else
            render json: { status: { error: "No record found"} }, status: 404 and return
        end
    end

    def create
        person = Person.new(person_params)
        if person.save
            render json: { status: { success: "Person created successfuly"} }, status: :ok and return
        else
            render json: { status: { error: person.errors.full_messages} }, status: :unprocessable_entity and return
        end
    end

    def show_details
        details = Detail.find_by(person_id: params["person_id"])
        if details.present?
            render json: { status: { success: "detail loaded successfuly", data: details} }, status: 200 and return
        else
            render json: { status: { error: "No record found"} }, status: 404 and return
        end
    end

    private

    def person_params
        params.require(:person).permit(:name)
    end

end
