class MainController < ApplicationController
  def index
  	@projects = Project.all
  	@sketches = Sketch.all
  end
end
