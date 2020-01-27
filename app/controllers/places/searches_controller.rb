class Places::SearchesController < ApplicationController

  def index
    # 時間

    @place = Place.find(params[:placeid])
    @restaurants = @place.restaurants
    @restaurant1 = Restaurant.find(1)
    
  # change dataType in places_helper.rb
    @dateTime1 = params[:time1]
    @dateTime2 = params[:time2]

   

  # ぐるなびAPIでレストラン検索
   @food = params[:food]
   gurunaviapiHash = Place.gurunaviApi(@place, @food)
   @restaurant_name = gurunaviapiHash[:name]
   @restaurant_text = gurunaviapiHash[:text]
   @restaurant_image = gurunaviapiHash[:image]
   

  # googleDerectionAPIで移動時間検索
   departure = params[:departure]
   mapapiHash = Place.googleApi(departure, @place)
   @map_duration = mapapiHash[:map_duration]


  end

end



# ActionController::Parameters {"mainPlace"=>"1", "time1"=>"2020-01-26T12:00", "time2"=>"2020-01-26T22:00", "RadioGroup1"=>"20", "food"=>"イタリアン", "placeid"=>"1", "controller"=>"places/searches", "action"=>"index"} permitted: false>