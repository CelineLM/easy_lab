class CheckupsController < ApplicationController
  def index
  end

  def new
  end

  def create
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
end
