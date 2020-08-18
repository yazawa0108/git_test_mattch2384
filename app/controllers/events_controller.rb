class EventsController < ApplicationController

  def index
  end

  def new
    @event = Event.new
    @prefectures = Prefecture.all
    @positions = Position.all
  end

  def create
    @event = Event.new
    if @event.save
      redirect_to events_path
    else
      render 'event#new'
    end
  end

end
