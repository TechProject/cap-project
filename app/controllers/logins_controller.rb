class LoginsController < ApplicationController
  
  def new
    
  end
  
  def create
    developer = Developer.find_by(email: params[:email])
    if developer && developer.authenticate(params[:password])
      session[:developer_id] = developer.id
      flash[:success] = "You are logged in."
      redirect_to programs_path
    else
      flash.now[:danger] = "Your email address/password does not match."
      render 'new'
    end  
  end
  
  def destroy
    session[:developer_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
  
end