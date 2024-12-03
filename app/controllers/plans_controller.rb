class PlansController < ApplicationController

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def show
    @plan = Plan.find(params[:id])
    @plan_recipes = @plan.plan_recipes.order(:position)
    generate_shopping_list(@plan) if params[:shopping_list] == "true"
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

  def show_shopping_list
    @plan = Plan.find(params[:id])
    #generate_shopping_list(@plan) if params[:shopping_list] == "true"
    @plan_recipes = @plan.plan_recipes
    @shopping_list = ShoppingList.where(plan: @plan).includes(:ingredient).order('ingredients.name')

  end

  private

  def plan_params
    params.require(:plan).permit(:title, :start_date, :end_date)
  end

  def plan_recipe_params
    params.require(:plan_recipe).permit(:recipe_id, :position)
  end

  def assign_positions_if_needed
    @plan.plan_recipes.each_with_index do |plan_recipe, index|
      if plan_recipe.position.nil?
        plan_recipe.update!(position: index + 1)
      end
    end
  end

  # def generate_shopping_list(plan)
  #   plan.shopping_lists.destroy_all
  #   recipe_ingredients = plan.recipes.includes(recipe_ingredients: :ingredient).flat_map(&:recipe_ingredients)
  #   grouped_ingredients = recipe_ingredients.group_by(&:ingredient_id)
  #   grouped_ingredients.each do |ingredient_id, grouped_ingredients_array|
  #     total_quantity = grouped_ingredients_array.sum(&:quantity)
  #     unit = grouped_ingredients_array.first.unit
  #     ShoppingList.create!(plan: plan, ingredient_id: ingredient_id, quantity: total_quantity, unit: unit)
  #   end
  # end

  def generate_shopping_list(plan)
    plan.recipes.each do |recipe|
      recipe.recipe_ingredients.each do |recipe_ingredient|
        if ShoppingList.find_by(plan: plan, ingredient: recipe_ingredient.ingredient)
          shopping_list = ShoppingList.find_by(plan: plan, ingredient: recipe_ingredient.ingredient)
          shopping_list.update(quantity: shopping_list.quantity + recipe_ingredient.quantity)
        else
          ShoppingList.create(plan: plan, ingredient: recipe_ingredient.ingredient, unit:recipe_ingredient.unit, quantity: recipe_ingredient.quantity)
        end
      end
    end
  end

end
