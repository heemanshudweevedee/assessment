class DetailsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
        details = Detail.all
        if details.present?
            render json: { status: { success: "detail loaded successfuly", data: details} }, status: 200 and return
        else
            render json: { status: { error: "No record found"} }, status: 404 and return
        end
    end

    def create
        detail = Detail.new(detail_params)

        if detail.save
            render json: { status: { success: "Detail created successfuly"} }
        else
            render json: { status: { error: detail.errors.full_messages} }, status: :unprocessable_entity and return
        end
    end


    private

    def detail_params
        params.require(:detail).permit(:person_id, :age, :email, :phone, :title)
    end

end
