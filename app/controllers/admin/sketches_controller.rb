class Admin::SketchesController < Admin::AdminController
  before_filter :find_or_build_sketch, :except => :index

  def new
  end

  def edit
  end

  def create
    if @sketch.save
      redirect_to @sketch
    else
      render :new
    end
  end

  def update
    if @sketch.update_attributes(params[:sketch])
      redirect_to @sketch, :notice => 'Sketch successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @sketch.destroy
    redirect_to sketches_path
  end

private
  def find_or_build_sketch
    @sketch = params[:id] ? Sketch.find(params[:id]) : Sketch.new(params[:sketch])
  end
end
