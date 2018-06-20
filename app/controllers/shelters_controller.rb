class SheltersController < ApplicationController
  before_action :set_shelter, only: [:show, :edit, :update]
  before_action :require_login, only: [:new, :create, :edit, :update]

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.build_location = location_params[:locations]
    if @shelter.valid?
      @shelter.save
      redirect_to shelter_path(@shelter)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @shelter.update(shelter_params)
    @shelter.update_location = location_params[:locations]
    if @shelter.valid?
      @shelter.save
    else
      render :edit
    end
    redirect_to shelter_path(@shelter)
  end

  def index
    @shelters = Shelter.all
  end


  private

    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    def location_params
      params.require(:shelter).permit(:locations => [:street_address, :city, :state, :country])
    end

    def shelter_params
      params.require(:shelter).permit(:name, :telephone_number, :email_address, :description, :website)
    end
end
