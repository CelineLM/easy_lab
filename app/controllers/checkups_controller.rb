class CheckupsController < ApplicationController
  def index
    @checkups = Checkup.where(user: current_user)
    @checkup = Checkup.new
  end

  def new
    @checkup = Checkup.new
    @results = params[:results]
  end

  def create
    @checkup = Checkup.new(checkup_params)
    @checkup.user = current_user
      if @checkup.save
        flash[:notice] = 'Analyse enregistrée.'
        redirect_to user_analyses_path
      else
        flash[:alert] = 'Il manque un ou plusieurs champs.'
        render :new
      end
  end
  
  def show
    @checkup = Checkup.find(params[:id])
    @user_analyses = @checkup.user_analyses
    @grouped_user_analyses = @user_analyses.group_by { |user_analysis| user_analysis.category }
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def checkup_params
    params.require(:checkup).permit(:realized_on, :laboratory_name, user_analyses_attributes: [:id, :name, :analysis_id ,:analysis, :value, :_destroy])
  end
end
