class CheckupsController < ApplicationController
  before_action :set_checkup, only: [:show, :edit, :update, :destroy]

  def index
    @checkups = Checkup.where(user: current_user).order(realized_on: :desc)
    @checkup = Checkup.new
  end

  def new
    @user_analysis = UserAnalysis.new
    @checkup = Checkup.new
    @results = params[:results]
  end

  def create
    @checkup = Checkup.new(checkup_params)
    @checkup.user = current_user
    if @checkup.save
      flash[:notice] = 'Analyse enregistrée.'
      redirect_to checkup_path(@checkup)
    else
      flash[:alert] = 'Il manque un ou plusieurs champs.'
      @results = eval(params[:checkup][:results])
      render :new
    end
  end

  def show
    @user_analyses = @checkup.user_analyses
    @grouped_user_analyses = @user_analyses.group_by { |user_analysis| user_analysis.category }
  end

  def edit
    @user_analyses = @checkup.user_analyses
  end

  def update
    @checkup.update(checkup_params)
    @checkup.user = current_user
    checkup_params["user_analyses_attributes"].each_value{|ua| UserAnalysis.find(ua["id"].to_i).update(ua)}
    if @checkup.save
      flash[:notice] = 'Analyse enregistrée.'
      redirect_to checkup_path(@checkup)
    else
      flash[:alert] = 'Il manque un ou plusieurs champs.'
      render :new
    end
  end

  def destroy
    @checkup.destroy
    redirect_to checkups_path
  end

  private

  def set_checkup
    @checkup = Checkup.find(params[:id])
  end

  def checkup_params
    params.require(:checkup).permit(:realized_on, :laboratory_name, user_analyses_attributes: [:id, :name, :analysis_id, :analysis, :value, :destroy])
  end
end
