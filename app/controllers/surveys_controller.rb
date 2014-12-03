class SurveysController < ApplicationController
  def index
    @surveys = Survey.where(:email => current_user.email)
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    5.times do
      question = @survey.questions.build
      4.times { question.answers.build }
    end
  end

  def create
    
    val=params[:survey]
    val[:email]=current_user.email
    @survey = Survey.new(val)
    if @survey.save
      redirect_to @survey, :notice => "Successfully created survey."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    puts params[:is_correct]
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end
end
