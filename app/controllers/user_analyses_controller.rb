class UserAnalysesController < ApplicationController
  def index
    @user_analyses = current_user.user_analyses
    @group = @user_analyses.group(:name)
    @values_array = [];
    @user_analyses.each do |user_analysis|
      @values_array << user_analysis.value
    end
    @values = @values_array.split.join(', ')
  end

  def update
  end

  def destroy
  end
end
