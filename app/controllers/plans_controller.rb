class PlansController < ApplicationController

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def show
    @plan = Plan.find(params[:id])
    @plan_recipes = @plan.plan_recipes.order(:position)
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
      redirect_to plan_path(@plan)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan = Plan.update(plan_params)
  end

  def edit_calendar
    @plan = Plan.find(params[:id])
    @plan_recipes = @plan.plan_recipes.order(:position)
    assign_positions_if_needed
  end

  def update_positions
    positions = params[:positions]

      positions.each do |id, position|
        plan_recipe = PlanRecipe.find(id)
        plan_recipe.update!(position: position)
      end

    render json: { success: true }
  rescue ActiveRecord::RecordInvalid => e
    render json: { success: false, error: e.message }, status: :unprocessable_entity
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :start_date, :end_date)
  end

  def plan_recipe_params
    params.require(:plan_recipe).permit(:recipe_id, :position)
  end

  def edit_recipes
  end

  def assign_positions_if_needed
    @plan.plan_recipes.each_with_index do |plan_recipe, index|
      if plan_recipe.position.nil?
        plan_recipe.update!(position: index + 1)
      end
    end
  end
end
