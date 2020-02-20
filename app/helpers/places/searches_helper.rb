module Places::SearchesHelper

  def strDate(dateTime)
    date = Date.parse("#{dateTime}")
   "#{date}"

  end


  def strTime(time1)
    
    timex1 = Time.parse("#{time1}")
    # timex2 = Time.parse("#{time2}")
    
    strTimex1 = timex1.strftime("%H:%M")
    # strTimex2 = timex2.strftime("%H:%M")
    # "#{strTimex1}〜#{strTimex2}"
    "#{strTimex1}"

  end

  
  def addHour(time, number)
    timex1 = Time.parse("#{time}")
    min_per = number/300.to_f
    min_per_five = min_per.ceil * 300
    timex2 = timex1 + min_per_five
  end

end
