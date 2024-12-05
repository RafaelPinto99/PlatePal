class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @plan = Plan.first # Fetch the first Plan or choose a specific one
    @plan_recipes = @plan.plan_recipes.limit(2) # Fetch only two recipes for this plan
  end
end
