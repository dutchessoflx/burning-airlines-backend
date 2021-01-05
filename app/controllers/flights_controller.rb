class FlightsController < ApplicationController
  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    flight = Flight.create(
      scheduled: params[:scheduled],
      to: params[:to],
      from: params[:from]
    )
    render json: flight
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    render json: Flight.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
