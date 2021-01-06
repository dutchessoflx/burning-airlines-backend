class FlightsController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false
  before_action :check_for_admin
  def new
    @flight = Flight.new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    flight = Flight.create(
      scheduled: params[:scheduled],
      to: params[:to],
      from: params[:from],
      flight_id: params[:flight_id],
      plane_id: params[:plane_id]
    )
    redirect_to flights_path
    # render json: flight
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @flights = Flight.all
    # render json: Flight.all
  end

  def show
    @flight= Flight.find params[:id]
  end

  def edit
    @flight = Flight.find params[:id]
  end

  def update
    @flight = Flight.find params[:id]
    @flight.update flight_params
    redirect_to flight_path(@flight.id)
  end

  def destroy
  end

  private
  def flight_params
    params.require(:flight).permit(:scheduled, :to, :from, :flight_id, :plane_id)
  end
end
