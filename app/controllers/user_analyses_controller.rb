class UserAnalysesController < ApplicationController
  def index
    @user_analyses = current_user.user_analyses
  end

  def update
  end

  def destroy
  end
end
