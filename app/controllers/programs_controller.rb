class ProgramsController < ApplicationController
  before_action :set_program, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @programs = Program.paginate(page: params[:page], per_page: 4)
  end
  
  def show
    
  end
  
  def new
    @program = Program.new
  end  
  
  def create
    @program = Program.new(program_params)
    @program.developer = current_user
    
    if @program.save
      flash[:success] = "Your program was created successfully."
      redirect_to programs_path
    else 
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @program.update(program_params)
      flash[:success] = "Your program was updated successfully."
      redirect_to  program_path(@program)
    else
      render :edit
    end  
  end
  
  def like
    like = Like.create(like: params[:like], developer: current_user, program: @program)
    if like.valid?
      flash[:success] = "Your selection was successfull."
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a program once."
      redirect_to :back
    end
  end
  
  private
  
    def program_params
      params.require(:program).permit(:name, :summary, :description, :picture)
    end
    
    def set_program
      @program = Program.find(params[:id])
    end
    
    def require_same_user
      if current_user != @program.developer
        flash[:danger] = "You can only edit your own programs."
        redirect_to programs_path
      end
    end
end