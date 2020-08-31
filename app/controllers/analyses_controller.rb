class AnalysesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @analyses = Analysis.all
    @categories = @analyses.group_by { |analysis| analysis.category }
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

end
