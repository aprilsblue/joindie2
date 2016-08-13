class HomeController < ApplicationController
  def index
    @events = Event.all
    @today = DateTime.now
    @date_today = @today.strftime("%A")

    case @date_today
    when "Sunday"
      @index = 1
    when "Monday"
      @index = 2
    when "Tuesday"
      @index = 3
    when "Wednsday"
      @index = 4
    when "Thursday"
      @index = 5
    when "Friday"
      @index = 6
    else
      @index = 7
    end

    @before_day = @index-1
    @after_day = 8-@index

    render :template => "index"
  end
end
