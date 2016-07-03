class SystemsController < ApplicationController
  def index
    @model = Model.find(params[:model_id])
    @systems = @model.systems
  end

  def show
    @system = System.find(params[:id])
  end

  def new
    @model = Model.find(params[:model_id])
    @system = System.new
  end

  def edit
    @system = System.find(params[:id])
  end

  def create
    @model = Model.find(params[:model_id])
    @system = System.new(system_params)
    @system.model = @model
    respond_to do |format|
      if @system.save
        format.html { redirect_to system_path(@system) }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    # render :text => params
    @system = System.find(params[:id])
    respond_to do |format|
      if @system.update(system_params)
        format.html{ redirect_to system_path(@system) }
      else
        format.html{ render :new }
      end
    end
  end

  def destroy
    @system = System.find(params[:id])
    @system.destroy
    respond_to do |format|
      format.html{ redirect_to model_systems_path(@system.model) }
    end
  end
  private
  def system_params
    params.require(:system).permit(:name, :description)
  end
end
