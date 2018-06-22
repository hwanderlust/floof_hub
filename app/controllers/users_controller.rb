class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update, :show_pets]
  before_action :require_login, only: [:edit, :update, :destroy, :show]

  def new
    @user = User.new
    @location = Location.new
  end

  def create
    @user = User.new(user_params)
    @user.build_location = location_params[:locations]
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @shelters = @user.find_shelters
  end

  def update
    @user.update(user_params)
    @user.update_location = location_params[:locations]

    if @user.valid?
      if user_params[:delete_avatar] == 1
        @user.avatar.destroy
        @user.avatar.clear
      end
      @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  def destroy
    User.delete(@user)
  end

  def show_pets
    @pets = @user.pets
    render :pets
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def location_params
      params.require(:user).permit(:locations => [:street_address, :city, :state, :country])
    end

    def user_params
      params.require(:user).permit(:name, :age, :dwelling_type, :household_members, :bio, :kids, :email_address, :password, :shelter_employee, :avatar, :employer_id, :delete_avatar, :password_confirmation)
    end


end
