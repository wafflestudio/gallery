class ProjectImagesController < ApplicationController
  before_filter :find_project
  before_filter :find_or_build_photo, :except => [:index, :sort]
  def index
  end
  def new
  end

  def edit
  end

  def show
  end

  def create
    if @photo.save
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
    @photo.destroy
    redirect_to @project
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
    @story = @project
  end

  def find_or_build_photo
    @photo = params[:id] ? @project.project_images.find(params[:id]) : @project.project_images.build(params[:photo])
  end


end
