class Places::SearchesController < ApplicationController

  def index
    @searches = Search.includes(:user).order("created_at DESC")
  end

  def new
    @search = Search.new

    # 時間
    @place = Place.find(params[:placeid])
    @subplace = Subplace.find_by(place_id: params[:placeid])
    @date = params[:example1]

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
    @lunch_restaurant_text = lunch_gurunaviapiHash[:text]
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

  def create
    Search.create(search_params)
    redirect_to places_searches_path
  end

  def show
    @if_true = params[:if_true]

    @search_date = params[:search_date]
    @search = Search.find(params[:id])
    @place = Place.find(@search.place_id)
    if @search.subplace_id
    @subplace = Subplace.find(@search.subplace_id)
    end
    @date = @search.went_date
    @restaurant_name = @search.dinner_name
    @restaurant_text = @search.dinner_text
    @restaurant_image = @search.dinner_image
    @restaurant_address = @search.dinner_address
    @restaurant_link = @search.dinner_link
    @lunch_restaurant_name = @search.lunch_name
    @lunch_restaurant_text = @search.lunch_text
    @lunch_restaurant_image = @search.lunch_image
    @lunch_restaurant_address = @search.lunch_address
    @lunch_restaurant_link = @search.lunch_link

    departure = params[:departure]
    place_address = @place.address

  if @if_true && @subplace
    # 出発地、ランチ場所、メインの行き先、サブの行き先、ディナーの場所の５点間の経過時間
    subplace_address = @subplace.address
    # mapapiHash3 = Place.googleApi_waypoint2(departure, @lunch_restaurant_address, place_address, subplace_address, @restaurant_address)
    mapapiHash3 = Place.googleApi_waypoint(origin: departure, waypoint1: @lunch_restaurant_address, waypoint2: place_address,waypoint3: subplace_address ,destination: @restaurant_address)
    @section1 = mapapiHash3["routes"][0]["legs"][0]["duration"]["value"]
    @section2 = mapapiHash3["routes"][0]["legs"][1]["duration"]["value"]
    @section3 = mapapiHash3["routes"][0]["legs"][2]["duration"]["value"]
    @section4 = mapapiHash3["routes"][0]["legs"][3]["duration"]["value"]
  elsif @if_true && !@subplace
    # 出発地、ランチ場所、メインの行き先、ディナーの場所の４点間の経過時間
    mapapiHash2 = Place.googleApi_waypoint(origin: departure, waypoint1: @lunch_restaurant_address, waypoint2: place_address, destination: @restaurant_address)
    @section1 = mapapiHash2["routes"][0]["legs"][0]["duration"]["value"]
    @section2 = mapapiHash2["routes"][0]["legs"][1]["duration"]["value"]
    @section3 = mapapiHash2["routes"][0]["legs"][2]["duration"]["value"]
  else
    @section1 = @search.section1
    @section2 = @search.section2
    @section3 = @search.section3
    @section4 = @search.section4
  end


  end

  private
  def search_params
    params.required(:search).permit(:lunch_name, :lunch_text, :lunch_image, :lunch_address, :lunch_link, :dinner_name, :dinner_text, :dinner_image, :dinner_address, :dinner_link, :section1, :section2, :section3, :section4, :plan_comment, :went_date, :place_id, :subplace_id, :user_id)
  end

end