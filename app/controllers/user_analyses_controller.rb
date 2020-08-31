class UserAnalysesController < ApplicationController
  def index
    @user_analyses = current_user.user_analyses
    @analyses_grouped_by_name = @user_analyses.group_by{ |user_analysis| user_analysis.name }.select { |name, instances| instances.size > 1 } 
  end
end
