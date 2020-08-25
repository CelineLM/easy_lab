class CheckupsController < ApplicationController

  require 'ocr_space'

  def index
  end

  def new

  end

  def create
    @checkup = Checkup.new(set_params)
    @checkup.save
    api_call
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_params
    params.require(:checkup).permit(:file)
  end

  def api_call
    path = Rails.application.routes.url_helpers.rails_blob_path(@checkup.file, only_path: true)
    resource = OcrSpace::Resource.new(apikey: ENV['OCR_API_KEY'])
    result = resource.convert file: path
    puts result
  end
end
