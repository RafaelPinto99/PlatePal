class PlansController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'rest-client'

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
      recipe_dataset
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

  def query
    survey = Survey.find_by(user_id: current_user.id)
    query = {
      minServings: survey.servings,
      maxServings: survey.servings,
      diet: survey.diet
    }.to_query
  end

  # def recipe_dataset
  #   api_key = '7aee109f0b16475dacf113da568394ff' #ENV['API_KEY']
  #   url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{api_key}&#{query}"
  #   api_recipes = RestClient.get(url)
  #   results = JSON.parse(api_recipes).flatten
  #   @recipes = []
  #   results[1].each do |recipe|
  #     @recipes << Recipe.create!(
  #       name: recipe["title"]
  #     )
  #   end
  # end

  def recipe_dataset
    api_key = ENV['API_KEY']
    url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{api_key}&#{query}"
    api_recipes = RestClient.get(url)
    results = JSON.parse(api_recipes).flatten
    recipe_details(results)
  end

  def recipe_details(results)
    api_key = ENV['API_KEY']
    @recipes = []
    results[1].each do |result|
      url_id = "https://api.spoonacular.com/recipes/#{result["id"]}/information?apiKey=#{api_key}"
      recipes_request = RestClient.get(url_id)
      recipes_hash = JSON.parse(recipes_request)
      Recipe.create(
        name: recipes_hash["title"],
        instructions: recipes_hash["instructions"],
        ingredients_list: recipes_hash["extendedIngredients"].map { |ingredient| {quantity: ingredient['amount'], unit: ingredient['measures']['metric']['unitLong'], name: ingredient['name']} },
        servings: recipes_hash["servings"],
        cook_time: recipes_hash["readyInMinutes"],
        calories: recipes_hash["summary"].match(/(\d+)\s*calories/)[1],
        restrictions: recipes_hash["diets"]
      )
      response = RestClient.get(recipes_hash["image"])
      io = StringIO.new(response.body)
      Recipe.last.photo.attach(
        io: io,
        filename: "#{Recipe.last.name.parameterize}.jpg",
        content_type: 'image/jpg'
      )
    
    end
  end
end
