class SurveysController < ApplicationController
  before_action :set_form_data, only: %i[step step_submit]

  def step
    @step = params[:step].to_i
    @total_steps = 4
  end

  def step_submit
    @step = params[:step].to_i
    @form_data.merge!(survey_params) if params[:survey]
    session[:form_data] = @form_data

    if params[:direction] == "previous"
      redirect_to survey_step_path(step: @step - 1)
    elsif @step < 3
      redirect_to survey_step_path(step: @step + 1)
    else
      redirect_to submit_survey_path
    end
  end

  def submit_survey
    @form_data = session[:form_data] || {}
    @form_data.merge!(survey_params) if params[:survey]

    if Survey.create(@form_data)
      session.delete(:form_data)
      redirect_to thank_you_path, notice: "Survey submitted successfully!"
    else
      redirect_to step_submit_path(step: 4), alert: "There was an error submitting your survey."
    end
  end

  private

  def set_form_data
    @form_data = session[:form_data] || {}
  end

  def survey_params
    params.require(:survey).permit(:goals, :preferences, :restrictions, :servings)
  end
end
