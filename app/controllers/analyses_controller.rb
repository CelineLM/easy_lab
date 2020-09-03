class AnalysesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @analyses = Analysis.all
    @categories = @analyses.group_by { |analysis| analysis.category }
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def search
    if params[:search][:query].present?
      @analysis = Analysis.where("name ILIKE ?", "%#{params[:search][:query]}%").first
      redirect_to analysis_path(@analysis)
    else
      redirect_to analyses_path
    end
  end

end
