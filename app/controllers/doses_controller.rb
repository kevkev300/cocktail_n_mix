class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(amount: dose_params[:amount],
                    unit: dose_params[:unit],
                    description: dose_params[:description])

    @dose.cocktail = @cocktail
    dose_ingredient(dose_params[:ingredient])[0]
    @dose.ingredient = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    Dose.delete(@dose.id)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :amount, :unit, :description)
  end

  def dose_ingredient(ingredient)
    ing = Ingredient.where(name: ingredient.downcase)
    if ing.empty?
      new_ing = Ingredient.create(name: ingredient.downcase)
      @ingredient = new_ing
    else
      @ingredient = ing
    end
  end
end
