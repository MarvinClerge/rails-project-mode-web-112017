class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to(request.env['HTTP_REFERER'])
    else
      flash[:error] = "Username and password do not match"
      redirect_to(request.env['HTTP_REFERER'])
    end

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
