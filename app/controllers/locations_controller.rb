class LocationsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
  def location_params
    params.require(:locations).permit(:street_address, :city, :state, :country)
  end
end
