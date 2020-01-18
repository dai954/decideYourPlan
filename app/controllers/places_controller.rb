class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def show
  end

end

# {"date1"=>"", "time1"=>"", "time2"=>"", "controller"=>"places", "action"=>"search"}
# {"date1"=>"2020-01-18", "time1"=>"12:30", "time2"=>"21:00", "RadioGroup1"=>"20", "controller"=>"places", "action"=>"search"} permitted: false>