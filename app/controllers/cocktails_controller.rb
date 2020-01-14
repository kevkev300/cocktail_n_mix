class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy, :like_unlike]

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

  def like_unlike
    if current_user.favorites.any? { |favorite| favorite.cocktail == @cocktail}
      Favorite.delete(Favorite.where(cocktail: @cocktail, user: current_user).first.id)
    else
      Favorite.create(user: current_user, cocktail: @cocktail)
    end

    render :change_heart
    # redirect_back fallback_location: root_path
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
