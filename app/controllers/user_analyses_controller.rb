class UserAnalysesController < ApplicationController
  def index
    @user_analyses = UserAnalysis.all
  end

  def update
  end

  def destroy
  end
end
