class PlanRecipesController < ApplicationController
  def index
    @plan = Plan.find(params[:plan_id])
    @plan_recipes = @plan.plan_recipes
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @plan_recipe = @plan.plan_recipes.find(params[:id])
    @shopping_list = ShoppingList.where(plan: @plan).includes(:ingredient).order('ingredients.name')
  end

  def new
    @plan = Plan.find(params[:plan_id])
    @plan.plan_recipes
  end

  # def create
  #   @plan = Plan.find(params[:plan_id])
  #   @plan_recipe = PlanRecipe.new(plan_recipe_params)
  #   @plan_recipe.plan_id = @plan.id
  #   if @plan_recipe.save
  #     redirect_to plan_path(@plan)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def edit
    @plan_recipe = plan_recipe.find(params[:id])
  end

  def update
    # @plan = Plan.find(params[:id])
    @plan_recipe = PlanRecipe.find(params[:id])
    @plan_recipe.recipe = Recipe.all.sample
    if @plan_recipe.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to show_recipes_path(@plan_recipe.plan) }
      end
    else
      render "plans/show", status: :unprocessable_entity
    end

    # @plan_recipe = plan_recipe.find(params[:id])
  end

  def destroy
    @plan_recipe = plan_recipe.find(params[:id])
    @plan_recipe.destroy
    redirect_to plan_path(@plan_recipe.plan), status: :see_other
  end

  def show_recipes
    @plan = Plan.find(params[:id])
  end

  private

  def plan_recipe_params
    params.require(:plan_recipe).permit(:recipe_id)
  end
end
