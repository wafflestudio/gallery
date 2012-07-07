class Admin::ProjectImagesController < Admin::AdminController
  def index
    @project_images = ProjectImage.all.desc(:created_at)
  end

  def show
    @project_image = ProjectImage.find(params[:id])
  end

  def new
    @project_image = ProjectImage.new
  end

  def edit
    @project_image = ProjectImage.find(params[:id])
  end

  def create
    @project_image = ProjectImage.new(params[:project_image])
    if @project_image.save
      redirect_to admin_project_images_path
    else
      render new_admin_project_image_path
    end
  end

  def update
    @project_image = ProjectImage.find(params[:id])
    if @project_image.update_attributes(params[:project_image])
      redirect_to admin_project_image_path(@project_image)
    else
      render edit_admin_project_image_path
    end
  end

  def destroy
    @project_image = ProjectImage.find(params[:id])
    @project_image.destroy
    redirect_to admin_project_images_path
  end
end
