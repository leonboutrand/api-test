class Api::V1::MissionsController < Api::V1::BaseController
  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find(params[:id])
  end
end
