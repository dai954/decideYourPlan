class Places::SearchesController < ApplicationController

  def index
    @place = Place.find(params[:placeid])
    @restaurants = @place.restaurants
    @restaurant1 = Restaurant.find(1)
    @restaurant2 = Restaurant.find(2)
    
  # change dataType in places_helper.rb
    @dateTime1 = params[:time1]
    @dateTime2 = params[:time2]


  end

end

# {"mainPlace"=>"2", "time1"=>"2020-01-19T12:00", "time2"=>"2020-01-19T22:00", "RadioGroup1"=>"20", "controller"=>"places/searches", "action"=>"index"} permitted: false>
