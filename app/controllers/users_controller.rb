class UsersController < ApplicationController
  def show
    @checkup = Checkup.new
    @user_analyses = current_user.user_analyses
    @analyses_grouped_by_name = @user_analyses.group_by{ |user_analysis| user_analysis.name }.select { |name, instances| name == "Cholestérol total" || name == "Glycémie à jeun" }
  end
end
