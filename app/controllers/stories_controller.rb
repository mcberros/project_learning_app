class StoriesController < ApplicationController
  before_filter :find_resource, only: [:show, :edit, :update]
  
  respond_to :html
 
  def index

    @stories = params[:project_id].present? ? Project.find(params[:project_id]).stories : Story.all

    respond_with(@stories)
  end
 
  def new
    respond_with(@story = Story.new(params[:story]))
  end
   
  def create
    @story = Story.new(params[:story])
    
    flash[:notice] = 'Successfully created story.' if @story.save
    
    respond_with(@story) do |format|
      format.html{ @story.valid? ? redirect_to(edit_story_path(@story)) : render('new') }
    end
  end
 
  def show
  end
 
  def edit
    respond_with(@story)
  end
  
  def update
    flash[:notice] = 'Successfully updated story.' if @story.update_attributes(params[:story])
      
    respond_with(@story) do |format|
      format.html{ @story.valid? ? redirect_to(edit_story_path(@story)) : render('edit') }
    end
  end
  
  def destroy; respond_with @story = Story.destroy(params[:id]); end
  
  def find_resource
    @story = Story.find(params[:id])
  end
end