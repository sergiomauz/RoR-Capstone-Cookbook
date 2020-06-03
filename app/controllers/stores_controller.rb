class StoresController < ApplicationController
  before_action :must_be_authenticated

  def index
    @stores = Store.all.order('name ASC')
    @page_title = 'STORES'
  end

  def new
    @store = Store.new
    @page_title = 'NEW STORE'
  end

  def edit
    @store = Store.find(params[:id])
    @page_title = 'EDIT STORE'
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      flash[:notice] = 'Store created!'
      redirect_to stores_path
    else
      @page_title = 'NEW STORE'
      flash.now[:error] = @store.errors.full_messages.join('. | ').to_s
      render 'new'
    end
  end

  def update
    @store = Store.find(params[:id])
    @store.name = store_params[:name]
    if @store.save
      flash[:notice] = 'Store updated!'
      redirect_to stores_path
    else
      @page_title = 'EDIT STORE'
      flash.now[:error] = @store.errors.full_messages.join('. | ').to_s
      render 'edit'
    end
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end
end
