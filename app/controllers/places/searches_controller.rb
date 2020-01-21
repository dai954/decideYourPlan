class Places::SearchesController < ApplicationController

  def index
    binding.pry
    number = params[:mainPlace]
    @place = Place.find(number.to_i - 1)
    @restaurants = @place.restaurants
    @restaurant1 = Restaurant.find(1)
    @restaurant2 = Restaurant.find(2)
    
    @dateTime1 = params[:time1]
    @dateTime2 = params[:time2]
    # change dataType in places_helper.rb

  end

end

# {"mainPlace"=>"2", "time1"=>"2020-01-19T12:00", "time2"=>"2020-01-19T22:00", "RadioGroup1"=>"20", "controller"=>"places/searches", "action"=>"index"} permitted: false>
