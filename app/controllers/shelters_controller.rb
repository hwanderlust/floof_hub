class SheltersController < ApplicationController
  before_action :set_shelter, only: [:show, :edit, :update]
  before_action :require_login, only: [:new, :create, :edit, :update]
  before_action :not_employee, only: [:new, :create, :edit, :update]

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
    if shelter_employee?(@shelter)
      render :edit
    else
      redirect_to shelter_path(@shelter)
    end
  end

  def update
    @shelter.update(shelter_params)
    @shelter.update_location = location_params[:locations]
    if @shelter.valid?
      if shelter_params[:delete_avatar] == 1
        @shelter.avatar.destroy
        @shelter.avatar.clear
      end
      @shelter.save
    else
      render :edit
    end
    redirect_to shelter_path(@shelter)
  end

  def index
    @shelters = Shelter.all
  end

  def search
    state = params[:search].titleize
    @shelters = Shelter.select{|s| s.location.state == state}
    if @shelters.empty?
      flash.now[:message] = "Unfortunately, there aren't any shelters in your state currently :( Please visit another time!"
    end
    render :index
  end


  private

    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    def location_params
      params.require(:shelter).permit(:locations => [:street_address, :city, :state, :country])
    end

    def shelter_params
      params.require(:shelter).permit(:name, :telephone_number, :email_address, :description, :website, :avatar, :delete_avatar)
    end
end
