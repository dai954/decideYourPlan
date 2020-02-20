class Place < ApplicationRecord

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

    result = Place.allApi(uri)
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


  def self.googleApi(origin, destination)


        # hash形式でパラメタ文字列を指定し、URL形式にエンコード
        origin_params = URI.encode_www_form({origin: "#{origin}"})
        destination_params = URI.encode_www_form({destination: "#{destination}"})
        google_keyid = ENV["GOOGLE_DIRECTIONS_PRIVATE_KEY"]

        uri2 = URI.parse("https://maps.googleapis.com/maps/api/directions/json?#{origin_params}&#{destination_params}&key=#{google_keyid}")
    
        map_result = Place.allApi(uri2)
        map_duration = map_result["routes"][0]["legs"][0]["duration"]["value"]
        mapapihash1 = {map_duration: map_duration}
       return mapapihash1
       
  end

  def self.googleApi_waypoint(origin, waypoint1, waypoint2, destination)


        # hash形式でパラメタ文字列を指定し、URL形式にエンコード
        origin_params = URI.encode_www_form({origin: "#{origin}"})
        waypoint1_params = URI.encode_www_form({destination: "#{waypoint1}"})
        waypoint2_params = URI.encode_www_form({destination: "#{waypoint2}"})
        destination_params = URI.encode_www_form({destination: "#{destination}"})
        google_keyid = ENV["GOOGLE_DIRECTIONS_PRIVATE_KEY"]

        # uri2 = URI.parse("https://maps.googleapis.com/maps/api/directions/json?#{origin_params}&#{destination_params}&waypoints=&key=#{google_keyid}")
        uri2 = URI.parse("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin_params}&destination=#{destination_params}&waypoints=#{waypoint1_params}|#{waypoint2_params}&key=#{google_keyid}")
    
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