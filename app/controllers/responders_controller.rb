class RespondersController < ApplicationController
  def create
    responder = Responder.new(create_params)
    if responder.valid?
      responder.save
      response = {responder: responder.attributes.slice("emergency_code",
                                       "name", "type", "capacity", "on_duty")}
      render :json => response.as_json, :status => 201
    else
      render :json => {:message => responder.errors.messages}.as_json, :status => 422
    end
  end
  ActionController::Parameters.action_on_unpermitted_parameters = :raise
  rescue_from(ActionController::UnpermittedParameters) do |pme|
    render json: { message:  "#{pme}" },
               status: 422
  end

  private

  def create_params
    params.require(:responder).permit(:type, :name, :capacity)
  end
end
