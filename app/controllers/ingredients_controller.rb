class IngredientsController < ApplicationController
  def index
    @page_title = 'NEW INGREDIENT'
  end

  def new
    @page_title = 'NEW INGREDIENT'
    @ingredient = current_user.ingredients.new
  end

  def edit
    @page_title = 'EDIT INGREDIENT'
    @ingredient = Ingredient.find(params[:id])
    @groups = Group.all
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

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.group_id = ingredient_params[:group_id]
    if @ingredient.save
      flash[:notice] = 'Ingredient updated!'
      redirect_to group_path(@ingredient.group_id)
    else
      @page_title = 'EDIT INGREDIENT'
      flash.now[:error] = @ingredient.errors.full_messages.join('. | ').to_s
      render edit_ingredient_path(@ingredient.id)
    end
  end

  def grouped
    user = User.find(session[:user_id])
    @page_title = 'INGREDIENTS'
    @grouped_ingredients = user.ingredients.grouped
    @spent = @grouped_ingredients.sum(&:amount)
  end

  def nongrouped
    @page_title = 'NON GROUPED'
    @non_grouped_ingredients = User.find(session[:user_id]).ingredients.non_grouped
    @spent = @non_grouped_ingredients.sum(&:amount)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount, :group_id)
  end
end
