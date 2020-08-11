module Places::SearchesHelper

  # ランチの時間の設定
  @@set_lunch_time = "11:30"
  @@set_lunch_end = "12:30"
  @@stay_time_a = 6
  @@stay_time_b = 4
  @@subplace_stay_time = 2

  def strDate(dateTime)
    date = Date.parse("#{dateTime}")
   "#{date}"
  end

  #string型のオブジェクトをパースしTimeオブジェクトに変換し、00:00の形にし、string型に戻して出力
  def strTime(time1)
    timex1 = Time.parse("#{time1}")
    strTimex1 = timex1.strftime("%H:%M")
    "#{strTimex1}"
  end

  def display_lunch_time
    "#{@@set_lunch_time} 〜 #{@@set_lunch_end}"
  end

  def display_lunch_arrival
    @@set_lunch_time
  end


  # 出発時間の計算ランチの時間(11:30)から、出発からランチ場所までの経過時間を引く
  def calc_departure_time(date, section1)
    set_lunch_time1 = date + "T" + @@set_lunch_time
    slt = Time.parse("#{set_lunch_time1}")
    section1_per_five = per_five_minutes(section1)
    departure_time = slt - section1_per_five
    departure_time.strftime("%H:%M")
  end

  def place_stay_time(date, section2)
    lunch_end_time = date + "T" + @@set_lunch_end
    let = Time.parse("#{lunch_end_time}")
    section2_per_five = per_five_minutes(section2)
    @arrival_time = let + section2_per_five
    if @subplace
      @plus_stay_time = @arrival_time + @@stay_time_b * 3600
    else
      @plus_stay_time = @arrival_time + @@stay_time_a * 3600
    end
    "#{@arrival_time.strftime("%H:%M")} 〜 #{@plus_stay_time.strftime("%H:%M")}"
  end

  def display_place_arrival
     @arrival_time.strftime("%H:%M")
  end

  def subplace_stay_time(date, section3)
      section3_per_five = per_five_minutes(section3)
      @subplace_arrival = @plus_stay_time + section3_per_five
      @plus_subplace_time = @subplace_arrival + @@subplace_stay_time * 3600
      "#{@subplace_arrival.strftime("%H:%M")} 〜 #{@plus_subplace_time.strftime("%H:%M")}"
  end

  def display_subplace_arrival
      @subplace_arrival.strftime("%H:%M")
  end

  def dinner_start_time(section3or4)
    section3or4_per_five = per_five_minutes(section3or4)
    if @subplace
      @plus_section_time = @plus_subplace_time + section3or4_per_five
    else
      @plus_section_time = @plus_stay_time + section3or4_per_five
    end
    "#{@plus_section_time.strftime("%H:%M")} 〜 "
  end

  def display_dinner_time
    @plus_section_time.strftime("%H:%M")
  end

  private
  def per_five_minutes(duration)
    section_per = duration/300.to_f
    section_per_five = section_per.ceil * 300
  end


end
