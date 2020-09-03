class UserAnalysesController < ApplicationController
  def index
    @user_analyses = current_user.user_analyses
    @analyses_grouped_by_name = @user_analyses.group_by { |user_analysis| user_analysis.name }.select { |_name, instances| instances.size > 1 }
    @checkups = @analyses_grouped_by_name.map { |_key ,value| value.map { |analyse| analyse.checkup } }
    @checkups.map {|type_checkup| type_checkup.sort! { |checkup, checkup2| checkup.realized_on <=> checkup2.realized_on }} 
  end
end
