class CheckupsController < ApplicationController
  def index
  end

  def new
    @checkup = Checkup.new
  end

  def create
    reader = PDF::Reader.new(params[:checkup][:file].open)
    split_table = reader.pages.first.text.split("\n")
    split_table.delete("""")
    leucocytes = split_table.grep(/Leucocytes/)
    a = leucocytes[0].match(/\d{1,2}[,]\d{1,2}/)
    b = a.to_s.gsub(",",".").to_f
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
