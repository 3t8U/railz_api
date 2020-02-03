class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    json_response(@spots)
  end

  def show
    if params[:search]
      @spot = @spot.search(params[:search])
    else
      @spot = Spot.find(params[:id])
    end
      json_response(@spot)
  end

  def search
    if params[:search]
      @spots = @spots.search(params[:search])
    end
    json_response(@spots)
  end

  def create
    @spot = Spot.create!(spot_params)
    json_response(@spot, :created)
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update!(spot_params)
      render status: 200, json: {
        message: "This spot has been updated successfully."
      }
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    if @spot.destroy!
      render status: 200, json: {
        message: 'This spot has been destoryed.'
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def spot_params
    params.permit(:name, :location, :description, :features, :spot_type, :img, :avg_rate)
  end
end
