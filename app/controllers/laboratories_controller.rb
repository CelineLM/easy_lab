class LaboratoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @laboratories = Laboratory.all
    if params[:address]
      @laboratories = Laboratory.near(params[:address], 2)
      @markers = @laboratories.geocoded.map do |laboratory|
        {
          lat: laboratory.latitude,
          lng: laboratory.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { laboratory: laboratory })
        }
      end
      results = Geocoder.search(params[:address])
      @markers << { lat: results.first.coordinates[0], lng: results.first.coordinates[1] }
    end
  end
end
