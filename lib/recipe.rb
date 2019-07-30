class Recipe

  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories

    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end

  def name_amount_of_ingredients
    new_hash = Hash.new


    ingredients.each do |ingredient|
      new_hash[ingredient.name] = amount_required(ingredient)
    end
    new_hash
  end
end
