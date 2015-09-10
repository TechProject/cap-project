class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end
  
  def show
    @program = Program.find(params[:id])
  end
  
  def new
    @program = Program.new
  end  
  
  def create
    @program = Program.new(program_params)
    @program.developer = Developer.find(2)
    
    if @program.save
      flash[:success] = "Your program was created successfully."
      redirect_to programs_path
    else 
      render :new
    end
  end
  
  def edit
    @program = Program.find(params[:id])
  end
  
  def update
    @program = Program.find(params[:id])
    if @program.update(program_params)
      flash[:success] = "Your program was updated successfully."
      redirect_to  program_path(@program)
    else
      render :edit
    end  
  end
  
  private
  
    def program_params
      params.require(:program).permit(:name, :summary, :description)
    end
end