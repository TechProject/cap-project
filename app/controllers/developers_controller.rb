class DevelopersController < ApplicationController
  before_action :set_developer, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @developers = Developer.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @developer = Developer.new
  end
  
  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:success] = "Your account has been create succesfully."
      session[:developer_id] = @developer.id
      redirect_to programs_path
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @developer.update(developer_params)
      flash[:success] = "Your profile has been updated succesfully."
      redirect_to developer_path(@developer)
    else
      render 'edit'
    end
  end
  
  def show
    
    @programs = @developer.programs.paginate(page: params[:page], per_page: 3)
  end
  
  private
  
    def developer_params
      params.require(:developer).permit(:developername, :email, :password)
    end
    
    def set_developer
      @developer = Developer.find(params[:id])
    end
    
    def require_same_user
      if current_user != @developer
        flash[:danger] = "You can only edit your own profile."
        redirect_to root_path
      end
    end
  
  
end