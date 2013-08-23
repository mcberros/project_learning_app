class SurveysController < ApplicationController
  skip_before_filter :require_login
  
  respond_to :html

  def index
    @surveys = Survey.all
  end
  
  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.answers.build }
    end
  end
  
  def create
    @survey = Survey.new(params[:survey])
    
    if @survey.save
      redirect_to surveys_url
    else
      render :new
    end
  end 
  
  def show
    @survey=Survey.find(params[:id])
  end
end