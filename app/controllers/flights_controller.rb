class FlightsController < ApplicationController
  # before_action :check_for_admin

  def new
    @flights = Flight.new
    @planes = Airplane.all.map{ |plane| [ plane.name, plane.id ] }
  end

  def create
    Flight.create flight_params
    redirect_to flights_path
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'

    if params[:to] || params[:from]
      @flights = Flight.where( to: params[:to], from: params[:from] )
      render json: @flights
    else
      @flights = Flight.all
    end
  end

  def react_index
    flights = Flight.where( to: params[:to], from: params[:from] )
    render json: flights
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
    params.require(:flight).permit(
      :scheduled, :to, :from, :flight, :airplane_id
    )
  end
end
