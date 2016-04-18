class RespondersController < ApplicationController

  def create
    responder = Responder.create(create_params)
    render :json => responder.as_json, :status => 201
  end

  private

  def create_params
    params.permit(:type, :name, :capacity)
  end
end
