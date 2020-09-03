class PdfsController < ApplicationController

  def create
    if params[:pdf].blank?
      @checkup = Checkup.new
      @user_analyses = current_user.user_analyses
      @analyses_grouped_by_name = @user_analyses.group_by{ |user_analysis| user_analysis.name }.select { |name, instances| instances.size > 1 }
      flash[:alert] = 'Fields cannot be blank.'
      render "users/show"
    else
      reader = PDF::Reader.new(params[:pdf][:file].open)
      split_table = reader.pages.first.text.split("\n")
      split_table.delete("""")
      allanalyse = Analysis.all
      results_array = {}
      allanalyse.each do |analyse|
        result = split_table.grep(/#{analyse.name}/)
        unless result.empty?
          results_array[analyse.id] = result.first.match(/\d{1,3}[,]\d{1,2}/).to_s.gsub(",", ".").to_f
        end
      end
      redirect_to new_checkup_path(results: results_array)
    end
  end
end
