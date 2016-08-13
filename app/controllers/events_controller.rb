class EventsController < ApplicationController
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @eventss }
    end
  end
end
