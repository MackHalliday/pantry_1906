class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    @recipes.map do |recipe|
      {name: recipe.name,
       details: {ingredients: recipe.ingredients_required.keys}, 
       total_calories: recipe.total_calories}
     end
  end
end
