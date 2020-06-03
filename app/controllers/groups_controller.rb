class GroupsController < ApplicationController
  before_action :must_be_authenticated

  def index
    @page_title = 'RECIPES'
    @groups = Group.all.order('name ASC')
  end

  def show
    group = Group.find(params[:id])
    @ingredients = group.ingredients
    @page_title = group.name
    @spent = group.total_amount
    @icon = group.icon
  end

  def new
    @page_title = 'NEW RECIPE'
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(name: group_params[:name])
    unless group_params[:image_file].nil?
      uploaded_file = Cloudinary::Uploader.upload(group_params[:image_file])
      @group.icon = uploaded_file['secure_url']
    end

    if @group.save
      flash[:notice] = 'Recipe created!'
      redirect_to groups_path
    else
      @page_title = 'NEW RECIPE'
      flash.now[:error] = @group.errors.full_messages.join('. | ').to_s
      render new_group_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :image_file)
  end
end
