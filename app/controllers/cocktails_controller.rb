class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user if current_user
    @cocktail.name.downcase!

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end
end
