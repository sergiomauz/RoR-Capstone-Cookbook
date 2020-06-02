class GroupsController < ApplicationController
  def index
    @page_title = 'ALL GROUPS'
    @groups = Group.all.order("name ASC")
  end    

  def new
    @page_title = 'NEW GROUP'
    @group = current_user.groups.new
  end     
  
  def create
    if !group_params[:image_file].nil?      
      uploaded_file = Cloudinary::Uploader.upload(group_params[:image_file])
      @group = current_user.groups.new(name: group_params[:name], icon: uploaded_file['secure_url'])      
    else
      @group = current_user.groups.new(name: group_params[:name])
    end
    
    if @group.save
      redirect_to(groups_path, notice: 'Group created!')
    else
      flash.now[:error] = @group.errors.full_messages.join('. | ').to_s
      render new_group_path
    end    
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :image_file)
  end  
end
