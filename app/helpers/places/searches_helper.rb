module Places::SearchesHelper

  def strDate(dateTime)
    date = Date.parse("#{dateTime}")
   "#{date}"

  end


  def strTime(time1, time2)
    
    timex1 = Time.parse("#{time1}")
    timex2 = Time.parse("#{time2}")
    
    strTimex1 = timex1.strftime("%H:%M")
    strTimex2 = timex2.strftime("%H:%M")
    "#{strTimex1}〜#{strTimex2}"

  end

  
  def addHour(time, number)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * number
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end


end
