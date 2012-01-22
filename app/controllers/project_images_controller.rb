class ProjectImagesController < ApplicationController
  before_filter :find_project
  before_filter :find_or_build_image, :except => [:index, :sort]
  def index
  end
  def new
  end

  def edit
  end

  def show
  end

  def create
    if @image.save
      respond_to do |format|
        format.js
      end
    else
    end
  end

  def sort
    params[:image].each_with_index do |id, idx|
      @project.project_images.find(id).position = idx
    end
    @project.save
    render :nothing => true
  end

  def destroy
    @image.project = nil
    @image.destroy
    redirect_to @project
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
    @story = @project
  end

  def find_or_build_image
    @image = params[:id] ? @project.project_images.find(params[:id]) : @project.project_images.build(params[:project_image])
  end


end
