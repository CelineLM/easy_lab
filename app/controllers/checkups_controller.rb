class CheckupsController < ApplicationController
  def index
    @checkups = Checkup.where(user: current_user)
  end

  def new
    @checkup = Checkup.new
  end

  def create
    reader = PDF::Reader.new(params[:checkup][:file].open)
    split_table = reader.pages.first.text.split("\n")
    split_table.delete("""")
    allanalyse = Analysis.all
    results_array  = []
    allanalyse.each do |analyse|
      result = split_table.grep(/#{analyse.name}/)
      unless result.empty?
        results_array << [analyse.name, result.first.match(/\d{1,2}[,]\d{1,2}/).to_s.gsub(",", ".").to_f]
      end
    end
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
