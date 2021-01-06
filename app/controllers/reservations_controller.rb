class ReservationsController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
    # headers['Access-Control-Allow-Origin'] = '*'
    reservation = Reservation.create(
      row: params[:seat_id].slice(0),
      cols: params[:seat_id].slice(1),
      user_id: params[:user_id],
      flight_id: params[:flight_id]
    )
    render json: reservation
  end

  def index
    # headers['Access-Control-Allow-Origin'] = '*'

    flight = Flight.find_by flight_number: params[:flight_number]
    seat_map = flight.generate_seat_map

    render json: { seat_map: seat_map, flight: flight }
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
