class RecipesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def new
    @recipe = Recipe.new
  end

  def create
    @recipes = []
    recipe_dataset[1].each do |recipe|
      @recipes << Recipe.create(
        name: recipe[:title]
      )
    end
    redirect_to new_plan_path
  end

  private

  def query
    survey = Survey.find_by(user_id: current_user.id)
    query = {
      minServings: survey.servings,
      maxServings: survey.servings,
      diet: survey.diet,
      number: 100
    }.to_query
  end

  def recipe_dataset
    api_key = '7aee109f0b16475dacf113da568394ff' #ENV['API_KEY']
    url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{api_key}&#{query}"
    api_recipes = RestClient.get(url)
    results = JSON.parse(api_recipes).flatten
    recipe_details(results)
  end

  def recipe_details(results)
    api_key = '7aee109f0b16475dacf113da568394ff' #ENV['API_KEY']
    @recipes = []
    results.each do |result|
      url = "https://api.spoonacular.com/recipes/#{result[:id]}/information?apiKey=#{api_key}"
      recipes_request = RestClient.get(url)
      recipes_array = JSON.parse(recipes).flatten
      recipes_array.each do |recipe|
        @recipes << Recipe.create(
          name: recipe[:title],
          instructions: recipe[:instructions],
          servings: recipe[:servings],
          cook_time: recipe[:readyInMinutes],
          calories: 10000,
          restrictions: recipe[:diets]
        )
        
      end
    end
  end
end
