class MainController < ApplicationController
  def index
  	@projects = Project.all
  	@sketches = Sketch.all
  end

  def show
  	@project = Project.find(params[:id])
  	render :layout => false
  end
end
