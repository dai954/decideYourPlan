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

  def addHour(time)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * 60
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end

  def addHourLunch(time)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * 120
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end

  def addHourMove1(time)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * 150
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end

  def addHourMain(time)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * 360
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end

  def addHourMove2(time)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * 420
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end

  def addHourDinner(time)
    timex1 = Time.parse("#{time}")
    timex = timex1 + 60 * 480
    strTimex = timex.strftime("%H:%M")
    "#{strTimex}"
  end

end
