class UserAnalysesController < ApplicationController
  def index
    @user_analyses = User_analysis.all
  end

  def update
  end

  def destroy
  end
end
