class PlansController < ApplicationController

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def show
    @plan = Plan.find(params[:id])
    # @recipes = Recipes.where(plan_id: @plan.id)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user = current_user
    if @plan.save!
      14.times do
        @plan_recipe = PlanRecipe.new
        @plan_recipe.plan_id = @plan.id
        @plan_recipe.recipe_id = Recipe.all.sample.id
        @plan_recipe.save
      end
      @plan.save!
      redirect_to show_recipes_path(@plan)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @plan = Plan.find(params[:id])
    @plan.plan_recipes
  end

  def update_plan_recipe
    @plan = Plan.find(params[:id])
    @plan.plan_recipes.recipe = Recipe.all.sample
  end

  def show_recipes
    @plan = Plan.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :start_date, :end_date)
  end

  def plan_recipe_params
    params.require(:plan_recipe).permit(:recipe_id)
  end

  def edit_calendar
  end
end
