class PlacesController < ApplicationController
  def index
    # binding.pry
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def show
  end

  def searchword
    @places = Place.search(params[:keyword])
  end

  def searchresult
    @place = Place.find(params[:key])
    @places = Place.all
  end

end

# {"date1"=>"", "time1"=>"", "time2"=>"", "controller"=>"places", "action"=>"search"}
# {"date1"=>"2020-01-18", "time1"=>"12:30", "time2"=>"21:00", "RadioGroup1"=>"20", "controller"=>"places", "action"=>"search"} permitted: false>