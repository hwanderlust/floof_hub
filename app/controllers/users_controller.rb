class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
before_action :require_login, only: [:edit, :update, :destroy]

  def new
    @user = User.new
    @location = Location.new
  end

  def create
    @user = User.new(user_params)
    @user.build_location = location_params[:locations]
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # def login
  #   byebug
  #   @user.update(login_params)
  #   redirect_to register_user_address
  # end
  #
  # def address
  #   byebug
  #   @user.build_location = location_params
  #   redirect_to user_path(@user)
  # end

  def show
  end

  def edit
  end

  def update
    # @t, @f = false
    # if @user.shelter_employee == true
    #   @t = true
    # elsif @user.shelter_employee == false
    #   @f = false
    # end
    @user.update(user_params)
    @user.update_location = location_params[:locations]
    if @user.valid?
      @user.save
    else
      render :edit
    end
    redirect_to user_path(@user)
  end

  def destroy
    User.delete(@user)
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def location_params
      params.require(:user).permit(:locations => [:street_address, :city, :state, :country])
    end

    def user_params
      params.require(:user).permit(:name, :age, :dwelling_type, :household_members,
      :bio, :kids, :email_address, :password, :shelter_employee)
    end

    # def login_params
    #   params.require(:user).permit(:email_address, :password)
    # end

end
