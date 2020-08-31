class LaboratoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @laboratories = Laboratory.all
    # @markers = @laboratories.geocoded.map do |laboratory|
    #   {
    #     lat: laboratory.latitude,
    #     lng: laboratory.longitude
    #   }
    # end
  end
end
