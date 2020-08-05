class Places::SearchesController < ApplicationController

  def index
    # 時間

    @place = Place.find(params[:placeid])
    @subplace = Subplace.find_by(place_id: params[:placeid])
  # change dataType in places_helper.rb
    @dateTime1 = params[:time1]
    # @dateTime2 = params[:time2]

   

  # ぐるなびAPIでレストラン検索 ディナー
   @food = params[:food]
   gurunaviapiHash = Place.gurunaviApi(@place, @food)
   @restaurant_name = gurunaviapiHash[:name]
   @restaurant_text = gurunaviapiHash[:text]
   @restaurant_image = gurunaviapiHash[:image]
   @restaurant_address = gurunaviapiHash[:address]
   @restaurant_link = gurunaviapiHash[:link]

  # ぐるなびAPIでレストラン検索 ランチ
  @lunch = params[:lunch]
  lunch_gurunaviapiHash = Place.gurunaviApi(@place, @lunch)
  @lunch_restaurant_name = lunch_gurunaviapiHash[:name]
  @luncn_restaurant_text = lunch_gurunaviapiHash[:text]
  @lunch_restaurant_image = lunch_gurunaviapiHash[:image]
  @lunch_restaurant_address = lunch_gurunaviapiHash[:address]
  @lunch_restaurant_link = lunch_gurunaviapiHash[:link]

  # googleDerectionAPIで移動時間検索
  departure = params[:departure]
  place_address = @place.address

  # # 出発地とメインの行き先の２点間の経過時間検索
  #  mapapiHash = Place.googleApi(departure, place_address)
  #  @map_duration = mapapiHash[:map_duration]

if @subplace
  # 出発地、ランチ場所、メインの行き先、サブの行き先、ディナーの場所の５点間の経過時間
  subplace_address = @subplace.address
  # mapapiHash3 = Place.googleApi_waypoint2(departure, @lunch_restaurant_address, place_address, subplace_address, @restaurant_address)
  mapapiHash3 = Place.googleApi_waypoint(origin: departure, waypoint1: @lunch_restaurant_address, waypoint2: place_address,waypoint3: subplace_address ,destination: @restaurant_address)
  @section1 = mapapiHash3["routes"][0]["legs"][0]["duration"]["value"]
  @section2 = mapapiHash3["routes"][0]["legs"][1]["duration"]["value"]
  @section3 = mapapiHash3["routes"][0]["legs"][2]["duration"]["value"]
  @section4 = mapapiHash3["routes"][0]["legs"][3]["duration"]["value"]

else
  # 出発地、ランチ場所、メインの行き先、ディナーの場所の４点間の経過時間
  mapapiHash2 = Place.googleApi_waypoint(origin: departure, waypoint1: @lunch_restaurant_address, waypoint2: place_address, destination: @restaurant_address)
  @section1 = mapapiHash2["routes"][0]["legs"][0]["duration"]["value"]
  @section2 = mapapiHash2["routes"][0]["legs"][1]["duration"]["value"]
  @section3 = mapapiHash2["routes"][0]["legs"][2]["duration"]["value"]
end

  end

end



# ActionController::Parameters {"mainPlace"=>"1", "time1"=>"2020-01-26T12:00", "time2"=>"2020-01-26T22:00", "RadioGroup1"=>"20", "food"=>"イタリアン", "placeid"=>"1", "controller"=>"places/searches", "action"=>"index"} permitted: false>