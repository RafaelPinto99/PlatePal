class PlansController < ApplicationController
  def show
    @plan = Plan.find(params[:id])
    # @recipes = Recipes.where(plan_id: @plan.id)
  end
end
