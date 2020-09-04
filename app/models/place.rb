class Place < ApplicationRecord
  belongs_to :subplace, optional: true
  has_many :search

  def self.search(search)
    return Place.all unless search
    Place.where('name LIKE(?)', "%#{search}%")
  end

  def self.gurunaviApi(place, food)
        # 住所の正規表現  メインの場所の住所を使う
    place_address = place.address

    rex = /(...??[都道府県])((?:旭川|伊達|石狩|盛岡|奥州|田村|南相馬|那須塩原|東村山|武蔵村山|羽村|十日町|上越|富山|野々市|大町|蒲郡|四日市|姫路|大和郡山|廿日市|下松|岩国|田川|大村)市|.+?郡(?:玉村|大町|.+?)[町村]|.+?市.+?区|.+?[市区町村])(.+)/
    rex_address = place_address.match(rex).captures
    rex_address1 = rex_address[0]
    rex_address2 = rex_address[1]
    
      # hash形式でパラメタ文字列を指定し、URL形式にエンコード

    paramskey = URI.encode_www_form({freeword: "#{rex_address1},#{rex_address2},#{food}"})

    gurunavi_keyid = ENV["GURUNAVI_PRIVATE_KEY"]

    uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{gurunavi_keyid}&#{paramskey}")

    result = allApi(uri)
    if result == "404 NOT FOUND" && food.include?("ランチ")
    paramskey = URI.encode_www_form({freeword: "#{rex_address1},#{rex_address2},ランチ"})
    uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{gurunavi_keyid}&#{paramskey}")
    result = allApi(uri)
    elsif result == "404 NOT FOUND"
    paramskey = URI.encode_www_form({freeword: "#{rex_address1},#{rex_address2}"})
    uri = URI.parse("https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{gurunavi_keyid}&#{paramskey}")
    result = allApi(uri)
    else
    end
    sample1 = result["@attributes"]
    sample2 = result["rest"][0]
    name = result["rest"][0]["name"]
    text = result["rest"][0]["pr"]["pr_short"]
    link = result["rest"][0]["url"]
    image = result["rest"][0]["image_url"]["shop_image1"]
    address = result["rest"][0]["address"]
    tel = result["rest"][0]["tel"]
    lunch = result["rest"][0]["lunch"]
    category = result["rest"][0]["code"]["category_name_s"][0]
    holiday = result["rest"][0]["holiday"]
    budget = result["rest"][0]["budget"]
    areaname_s = result["rest"][0]["code"]["areaname_s"]
    gurunaviapiHash1 = {name: name, text: text, image: image, address: address, link: link}
    return gurunaviapiHash1

    
  end


  def self.googleApi_waypoint(**waypoint_hash)

    origin = waypoint_hash[:origin]
    waypoint1 = waypoint_hash[:waypoint1]
    waypoint2 = waypoint_hash[:waypoint2]
    destination = waypoint_hash[:destination]
    # subplaceがない場合中身はnil
    waypoint3 = waypoint_hash[:waypoint3]


        # hash形式でパラメタ文字列を指定し、URL形式にエンコード
        origin_params = URI.encode_www_form({origin: "#{origin}"})
        waypoint1_params = URI.encode_www_form({destination: "#{waypoint1}"})
        waypoint2_params = URI.encode_www_form({destination: "#{waypoint2}"})
        destination_params = URI.encode_www_form({destination: "#{destination}"})
        google_keyid = ENV["GOOGLE_DIRECTIONS_PRIVATE_KEY"]
       
        if waypoint3
          waypoint3_params = URI.encode_www_form({destination: "#{waypoint3}"})
          uri2 = URI.parse("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin_params}&destination=#{destination_params}&waypoints=#{waypoint1_params}|#{waypoint2_params}|#{waypoint3_params}&key=#{google_keyid}")
        else
          uri2 = URI.parse("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin_params}&destination=#{destination_params}&waypoints=#{waypoint1_params}|#{waypoint2_params}&key=#{google_keyid}")
        end

        map_result = Place.allApi(uri2)

        # map_duration = map_result["routes"][0]["legs"][0]["duration"]["value"]
        # mapapihash1 = {map_duration: map_duration}
       return map_result
  end


  
  private
  def self.allApi(uri)
       # https  sslを使用する場合
       http = Net::HTTP.new(uri.host, uri.port)
       http.use_ssl = uri.scheme === "https"
       http.open_timeout = 5
       http.read_timeout = 10
       http.start
       response = http.get(uri.request_uri)
       http.finish
     # 例外処理の開始
    begin
       # responseの値に応じて処理を分ける
       case response
       # 成功した場合
       when Net::HTTPSuccess
         # responseのbody要素をJSON形式で解釈し、hashに変換
         result1 = JSON.parse(response.body)
       # 別のURLに飛ばされた場合
       when Net::HTTPRedirection
         message = "Redirection: code=#{response.code} message=#{response.message}"
              # 404エラー時
       when Net::HTTPNotFound
         message = "404 NOT FOUND"
       # その他エラー
       else
         message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
       end
     # エラー時処理
     rescue IOError => e
       message = "e.message"
     rescue TimeoutError => e
       message = "e.message"
     rescue JSON::ParserError => e
       message = "e.message"
     rescue => e
       message = "e.message"
     
   end

  end

end