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
      if @analysis.blank?
        flash[:alert] = "Nous n'avons pas trouver de correspondance à votre recherche"
        redirect_to analyses_path
      else
        redirect_to analysis_path(@analysis)
      end
    else
      flash[:alert] = 'La recherche ne peut pas être vide!'
      redirect_to analyses_path
    end
  end
end


