class ProjectsController < ApplicationController
  before_filter :find_resource, only: [:show, :edit, :update]
  
  respond_to :html
 
  def index
    respond_with(@projects = Project.all)
  end
 
  def new
    respond_with(@project = Project.new(params[:project]))
  end
 
  def create
    @project = Project.new(params[:project])
    
    flash[:notice] = 'Successfully created project.' if @project.save
    
    respond_with(@project) do |format|
      format.html{ @project.valid? ? redirect_to(edit_project_path(@project)) : render('new') }
    end
  end
 
  def show
  end
 
  def edit
    respond_with(@project)
  end
  
  def update
    flash[:notice] = 'Successfully updated project.' if @project.update_attributes(params[:project])
      
    respond_with(@project) do |format|
      format.html{ @project.valid? ? redirect_to(edit_project_path(@project)) : render('edit') }
    end
  end
  
  def destroy; respond_with @project = Project.destroy(params[:id]); end
  
  def find_resource
    @project = Project.find(params[:id])
  end
end