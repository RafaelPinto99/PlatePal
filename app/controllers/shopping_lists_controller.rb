class ShoppingListsController < ApplicationController

  # def create

  #   @plan = Plan.find(1)
  #   # @plan.shopping_lists.destroy_all
  #   # raise
  #   @recipes = @plan.recipes
  #   @ingredients = []
  #   @recipes.each do |recipe|
  #     recipe.recipe_ingredients
  #   end

  #   @ingredients.flatten.each do |recipe|
  #     recipe.recipe_ingredients.each do |recipe_ingredient|
  #       if ShoppingList.find_by(plan: plan, ingredient: recipe_ingredient.ingredient)
  #         shopping_list = ShoppingList.find_by(plan: plan, ingredient: recipe_ingredient.ingredient)
  #         shopping_list.update(quantity: shopping_list.quantity + recipe_ingredient.quantity)
  #       else
  #         ShoppingList.create(plan: plan, ingredient: recipe_ingredient.ingredient, unit:recipe_ingredient.unit, quantity: recipe_ingredient.quantity)
  #       end
  #     end
  #   end

    # @ingred

    # ShoppingList.create(
    #   plan:,
    #   ingredient_id:,
    #   quantity:,
    #   unit:
    # )
    # raise
    # @plan.shopping_lists.destroy_all
    # recipe_ingredients = @plan.recipes.includes(recipe_ingredients: :ingredient).flat_map(&:recipe_ingredients)
    # grouped_ingredients = recipe_ingredients.group_by(&:ingredient_id)
    # grouped_ingredients.each do |ingredient_id, grouped_ingredients_array|
    #   total_quantity = grouped_ingredients_array.sum(&:quantity)
    #   unit = grouped_ingredients_array.first.unit
    #   ShoppingList.create!(plan: @plan, ingredient_id: ingredient_id, quantity: total_quantity, unit: unit)

  #   redirect_to plan_path(@plan)
  # end

  def edit
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.plan = Plan.find(@shopping_list.plan_id)
  end

  def update
    @shopping_list = ShoppingList.find(params[:id])
    @plan = Plan.find(@shopping_list.plan_id)
    @shopping_list.update(shopping_list_params)
    @plan.save!
    redirect_to show_shopping_list_path(@plan)
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:quantity)
  end
end
