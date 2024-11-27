
class SurveysController < ApplicationController
  def step_one
    @form_data = session[:form_data] || {}
    @step = 0
    @total_steps = 0
  end

  def step_two
    @form_data = session[:form_data] || {}
    @form_data.merge!(survey_params) if params[:survey]
    session[:form_data] = @form_data
  end

  def step_three
    @form_data = session[:form_data] || {}
    @form_data.merge!(survey_params) if params[:survey]
    session[:form_data] = @form_data
  end

  def step_four
    @form_data = session[:form_data] || {}
    @form_data.merge!(survey_params) if params[:survey]
    session[:form_data] = @form_data
  end

  def submit_survey
    @form_data = session[:form_data] || {}
    @form_data.merge!(survey_params) if params[:survey]
  end

  private

  def survey_params
    params.require(:survey).permit(:goals, :preferences, :restrictions, :servings)
  end
end
