module EventsHelper
  def get_next_day(date, day_of_week)
    date + ((day_of_week - date.wday) % 7)
  end

  def get_previous_day(date, day_of_week)
    date - ((date.wday - day_of_week) % 7)
  end
end
