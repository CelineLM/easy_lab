class CheckupsController < ApplicationController
  before_action :set_checkup, only: [:show, :edit, :update, :destroy]

  def index
    @checkups = Checkup.where(user: current_user)
    @checkup = Checkup.new
  end

  def new
    @checkup = Checkup.new
  end

  def create
    #redirect_to new_checkup_path
  end

  def show
    @user_analyses = @checkup.user_analyses
    @grouped_user_analyses = @user_analyses.group_by { |user_analysis| user_analysis.category }
  end

  def edit
  end

  def update
  end

  def destroy
    @checkup.destroy
    redirect_to checkups_path
  end

  private

  def set_checkup
    @checkup = Checkup.find(params[:id])
  end
end
