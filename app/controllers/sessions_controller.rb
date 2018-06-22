class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email_address: params[:sessions][:email_address])
    user = user.try(:authenticate, params[:sessions][:password])
    if user
      session[:user_id] = user.id
      @user = user
      redirect_to root_path
    else
      flash[:notice] = "Invalid email/password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private
  def session_params
    params.require(:sessions).permit(:email_address, :password)
  end
end
