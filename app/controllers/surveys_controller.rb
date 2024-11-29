class SurveysController < ApplicationController
  include Wicked::Wizard

  steps :goal, :availability, :diet, :servings

  def show
    @survey = Survey.new
    render_wizard
  end

  def update
    @user = current_user
    # When the first step is submitted, we find or create a survey for the user.
    # This means there will only ever be one survey per user.
    @survey = @user.surveys.first_or_create(survey_params)

    @survey.update(survey_params)

    render_wizard @survey
  end

  def finish_wizard_path
    new_plan_path
  end

  private

  def survey_params
    params.require(:survey).permit(:goal, :availability, :diet, :servings)
  end
end
