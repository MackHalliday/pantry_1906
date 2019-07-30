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

  # def name_amount_of_ingredients
  #   name_amount = Hash.new
  #
  #   ingredients.each do |ingredient|
  #     name_amount[ingredient.name] = amount_required(ingredient)
  #   end
  #   name_amount
  # end

  def ingredient_hash

    @ingredients_required.map do |ingredient, amount|
      {ingredient: ingredient.name,
       amount: amount.to_s + " " + ingredient.unit}
    end
  end
end
