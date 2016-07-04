class AircraftsController < ApplicationController
  def index
    @aircrafts  = Aircraft.all
  end

  def show
    @aircraft = Aircraft.find(params[:id])
  end
  def new
    @aircraft = Aircraft.new
    @models = Model.all
  end

  def edit
    @aircraft = Aircraft.find(params[:id])
    @models = Model.all
  end

  def create
    @aircraft  = Aircraft.new(aircraft_params)
    @models = Model.all
    respond_to do |format|
      if @aircraft.save
        format.html{ redirect_to @aircraft }
      else
        format.html{ render :new }
      end
    end
  end

  def update
    @aircraft = Aircraft.find(params[:id])
    @models = Model.all
    respond_to do |format|
      if @aircraft.update(aircraft_params)
        format.html{ redirect_to @aircraft }
      else
        format.html{ render :edit }
      end
    end
  end

  def destroy
    @aircraft = Aircraft.find(params[:id])
    @aircraft.destroy
    respond_to do |format|
      format.html{ redirect_to aircrafts_url }
    end
  end
  private
  def aircraft_params
    params.require(:aircraft).permit(:model_id, :name, :aircraft_registration)
  end
end
