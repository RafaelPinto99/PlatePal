class SurveysController < ApplicationController
  def step_one
    @form_data = session[:form_data] || {}
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

    # Assuming you have a Survey model to save the final data
    @survey = Survey.new(@form_data)
    if @survey.save
      session.delete(:form_data)
      redirect_to success_path, notice: "Survey submitted successfully!"
    else
      render :step_four
    end
  end

  private

  def save_to_session
    session[:form_data].merge!(survey_params)
  end

  def survey_params
    params.require(:survey).permit(:goals, :preferences, :restrictions, :servings)
  end
end
