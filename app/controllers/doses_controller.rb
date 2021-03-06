class DosesController < ApplicationController
  def new
    @dose = Dose.new()
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.all
  end

  def create
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      @ingredient = Ingredient.all
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
