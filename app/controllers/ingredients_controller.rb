class IngredientsController < ApplicationController
  def index
    @page_title = 'NEW INGREDIENT'
  end

  def new
    @page_title = 'NEW INGREDIENT'
    @ingredient = current_user.ingredients.new
  end

  def create
    @ingredient = current_user.ingredients.new(name: ingredient_params[:name], amount: ingredient_params[:amount])
    if @ingredient.save
      flash[:notice] = 'Ingredient created!'
      redirect_to non_grouped_ingredients_path
    else
      @page_title = 'NEW INGREDIENT'
      flash.now[:error] = @ingredient.errors.full_messages.join('. | ').to_s
      render new_ingredient_path
    end
  end

  def grouped
    @page_title = 'INGREDIENTS'
    @grouped_ingredients = User.find(session[:user_id]).ingredients.grouped
  end

  def nongrouped
    @page_title = 'NON GROUPED'
    @non_grouped_ingredients = User.find(session[:user_id]).ingredients.non_grouped
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount)
  end
end
