class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]

  # basic CRUD

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
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

  def destroy
    doses = Dose.where(cocktail: @cocktail)
    delete_dependent(doses)

    Cocktail.delete(@cocktail.id)
    redirect_to root_path
  end

  # custom methods

  def favorites
    favorites = current_user.favorites
    @cocktails = favorites.map { |favorite| favorite.cocktail }
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def delete_dependent(arr)
    arr.each { |item| item.delete }
  end
end
