class ComponentsController < ApplicationController
  def index
    @system = System.find(params[:system_id])
    @components = @system.components
  end

  def show
    @component = Component.find(params[:id])
  end
  def new
    @system = System.find(params[:system_id])
    @component = Component.new
  end

  def edit
    @component = Component.find(params[:id])
  end

  def create
    # render :text =>  params
    @system = System.find(params[:system_id])
    @component = Component.new(component_params)
    @component.system = @system
    respond_to do |format|
      if @component.save
        format.html{ redirect_to @component }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    # render :text => params
    @component = Component.find(params[:id])
    respond_to do |format|
      if @component.update(component_params)
        format.html{ redirect_to @component }
      else
        format.html{ render :edit }
      end
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy
    respond_to do |format|
      format.html{ redirect_to system_components_path(@component.system) }
    end
  end
  private
  def component_params
    params.require(:component).permit(:name, :description)
  end
end
