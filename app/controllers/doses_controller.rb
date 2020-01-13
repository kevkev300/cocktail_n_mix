class DosesController < ApplicationController
  def create
    @dose = Dose.new(amount: dose_params[:amount],
                    unit: dose_params[:unit],
                    description: dose_params[:description])

    @dose.cocktail = @cocktail
    @dose.ingredient = dose_ingredient(dose_params[:ingredient][0])

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :amount, :unit, :description)
  end

  def dose_ingredient(ingredient)
    ing = Ingredient.where(name: ingredient.downcase)
    if ing
      return ing
    else
      new_ing = Ingredient.create(name: ingredient.downcase)
      return new_ing
    end
  end
end
