include CloudinaryHelper

class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy

    redirect_to @cocktail
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def get_cocktail_image(cocktail)
    if cocktail.photo.attached?
      cl_image_path cocktail.photo.key
    else
      cl_image_path "default_img.jpg"
    end
  end

  helper_method :get_cocktail_image
end
