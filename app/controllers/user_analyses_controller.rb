class UserAnalysesController < ApplicationController
  def index
    @user_analyses = UserAnalysis.all
    # .where(checkup.user: current_user)
  end

  def update
  end

  def destroy
  end
end
