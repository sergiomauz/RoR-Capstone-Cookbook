class GroupsController < ApplicationController
  def index
    @page_title = 'ALL GROUPS'
    @groups = Group.all.order('name ASC')
  end

  def new
    @page_title = 'NEW GROUP'
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(name: group_params[:name])
    unless group_params[:image_file].nil?
      uploaded_file = Cloudinary::Uploader.upload(group_params[:image_file])
      @group.icon = uploaded_file['secure_url']
    end

    if @group.save
      flash[:notice] = 'Group created!'
      redirect_to groups_path
    else
      @page_title = 'NEW GROUP'
      flash.now[:error] = @group.errors.full_messages.join('. | ').to_s
      render new_group_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :image_file)
  end
end
