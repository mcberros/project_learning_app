class TasksController < ApplicationController
  before_filter :find_resource, only: [:show, :edit, :update]
  
  respond_to :html
 
  def index

    @tasks = params[:story_id].present? ? Story.find(params[:story_id]).tasks : Task.all

    respond_with(@tasks)
  end
 
  def new
    respond_with(@task = Task.new(params[:task]))
  end
   
  def create
    @task = Task.new(params[:task])
    
    flash[:notice] = 'Successfully created task.' if @task.save
    
    respond_with(@task) do |format|
      format.html{ @task.valid? ? redirect_to(edit_task_path(@task)) : render('new') }
    end
  end
 
  def show
  end
 
  def edit
    respond_with(@task)
  end
  
  def update
    flash[:notice] = 'Successfully updated task.' if @task.update_attributes(params[:task])
      
    respond_with(@task) do |format|
      format.html{ @task.valid? ? redirect_to(edit_task_path(@task)) : render('edit') }
    end
  end
  
  def destroy; respond_with @task = Task.destroy(params[:id]); end
  
  def find_resource
    @task = Task.find(params[:id])
  end
end