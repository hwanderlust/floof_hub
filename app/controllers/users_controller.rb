class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    location = Location.make(all_params[:locations])
    @user = User.new(user_params)
    @user.location = location
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  private

  def all_params
    params.require(:user).permit!
  end

  def user_params
    params.require(:user).permit(:name, :age, :dwelling_type, :household_members,
    :bio, :kids, :email_address, :password, :shelter_employee)
  end

end
