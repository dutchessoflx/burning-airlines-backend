class FlightsController < ApplicationController
  before_action :check_for_admin

  def new
    @flights = Flight.new
    @planes = Airplane.all.map{ |plane| [ plane.name, plane.id ] }
  end

  def create
    Flight.create flight_params
    redirect_to flights_path
  end

  def index
    @flights = Flight.all

    respond_to do |format|
      format.html { @flights }
      format.json { render json: @flights }
    end
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
      :scheduled, :to, :from, :flight, :plane_id
    )
  end
end
