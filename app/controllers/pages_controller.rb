class PagesController < ApplicationController
  def home
    redirect_to programs_path if logged_in?
  end
end