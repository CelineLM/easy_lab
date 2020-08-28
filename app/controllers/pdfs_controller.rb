class PdfsController < ApplicationController

  def create
    #if params[:pdf]
      reader = PDF::Reader.new(params[:pdf][:file].open)
      split_table = reader.pages.first.text.split("\n")
      split_table.delete("""")
      allanalyse = Analysis.all
      results_array = {}
      allanalyse.each do |analyse|
        result = split_table.grep(/#{analyse.name}/)
        unless result.empty?
          results_array[analyse.id] = result.first.match(/\d{1,2}[,]\d{1,2}/).to_s.gsub(",", ".").to_f
        end
      end
      redirect_to new_checkup_path(results: results_array)
    #else
     # @checkup = params
      #render "checkups/new"
    #end
  end
end
