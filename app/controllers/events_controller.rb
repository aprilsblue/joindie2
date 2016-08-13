class EventsController < ApplicationController
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

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @eventss }
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @event }
    end
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render xml: @event, status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  private

  def event_params
    params.require(:event).permit(:event_place, :start_time, :end_time, :rental_fee, :event_date)
  end
end
