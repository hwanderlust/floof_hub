class PetsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_pet, only: [:edit, :update, :destroy, :show]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.shelter = current_user.employer
    if @pet.valid?
      @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    if shelter_employee?(@pet.shelter)
      render :edit
    else
      redirect_to pet_path(@pet)
    end
  end

  def update
    @pet.update(pet_params)
    if @pet.valid?
      if pet_params[:delete_avatar] == 1
        @pet.avatar.destroy
        @pet.avatar.clear
      end
      @pet.save
      redirect_to pet_path(@pet)
    else
      render :edit
    end

  end

  def destroy
  end

  def index
    @pets = Pet.all
  end

  def show
  end

  def search
    state = params[:search].titleize
    @pets = Pet.select{|p| p.shelter.location.state == state}
    if @pets.empty?
      flash.now[:message] = "Unfortunately, there aren't any pets in your state currently :( Please visit another time!"
    end
    render :index
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :age, :temperament, :bio, :single_pet, :family_friendly, :gender, :shelter_id, :avatar, :delete_avatar)
  end
end
