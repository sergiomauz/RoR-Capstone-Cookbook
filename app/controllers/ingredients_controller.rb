class IngredientsController < ApplicationController
  def index
    page_title = 'INGREDIENTS'
  end

  def grouped    
    user = User.find(session[:user_id])
    @page_title = 'INGREDIENTS'        
    @grouped_ingredients = user.ingredients.grouped
  end
  
  def nongrouped    
    user = User.find(session[:user_id])
    @page_title = 'UNGROUPED INGREDIENTS'
    @non_grouped_ingredients = user.ingredients.non_grouped
  end  

  def new
    @page_title = 'NEW INGREDIENT'
    @ingredient = current_user.ingredients.new
  end     
  
  def create    
    @ingredient = current_user.ingredients.new(name: ingredient_params[:name], amount: ingredient_params[:amount])
    if @ingredient.save
      redirect_to(ingredients_path, notice: 'Group created!')
    else
      redirect_to(new_ingredient_path, error: 'It failed!. ' + @ingredient.errors.full_messages[0].to_s)
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount)
  end    
end
