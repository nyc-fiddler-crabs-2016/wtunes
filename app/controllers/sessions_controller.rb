class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] =  "#{@user.user_name} is successfully logged in."
      redirect_to albums_path
    else
      flash[:error] = "username or password is incorrect."
      render 'new'
  end
end


  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end


end