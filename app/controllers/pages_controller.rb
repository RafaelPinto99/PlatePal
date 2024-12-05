class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @recipes = Recipe.all # Fetch the first Plan or choose a specific one
    @plan_recipes = @recipes.limit(2)
  end
end
