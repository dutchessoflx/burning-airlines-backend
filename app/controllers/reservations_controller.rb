class ReservationsController < ApplicationController
  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    reservation = Reservation.create(

    )
    render json: reservation
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    render json: Reservation.all
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
