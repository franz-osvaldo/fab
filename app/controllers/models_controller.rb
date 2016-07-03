class ModelsController < ApplicationController
  def index
    @models = Model.all
  end

  def show
    @model = Model.find(params[:id])
  end

  def new
    @model  = Model.new
  end

  def edit
    @model = Model.find(params[:id])
  end

  def create
    @model = Model.new(model_params)
    respond_to do |format|
      if @model.save
        format.html{ redirect_to @model }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    @model = Model.find(params[:id])
    respond_to do |format|
      if @model.update(model_params)
        format.html{ redirect_to @model }
      else
        format.html{ render :edit }
      end
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
    respond_to do |format|
      format.html{ redirect_to models_url }
    end
  end
  private
  def model_params
    params.require(:model).permit(:manufacturer, :model, :capacity, :maximum_takeoff_weight)
  end
end
