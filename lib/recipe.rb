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

  def total_cal_by_ingredient(ingredient)
    ingredient.calories * amount_required(ingredient)
  end

  def each_ingredient_amount
   by_calories = @ingredients_required.group_by do |ingredient, amount|
     total_cal_by_ingredient(ingredient)
    end

  ingredient_list = @ingredients_required.map do |ingredient, amount|
    {ingredient: ingredient.name,
     amount: amount.to_s + " " + ingredient.unit}
   end
  end
end
