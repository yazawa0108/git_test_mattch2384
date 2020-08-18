class EventsController < ApplicationController

  def index
  end

  def new
    @event = Event.new
    @prefectures = Prefecture.all
    @positions = Position.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "案件が投稿されました。"
      redirect_to events_path
    else
      render 'event#new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :start_day, :end_day, :work_start_time, :work_end_time, :prefecture_id, :address, :daily_wage, :detail, :position_id, :assign_num, :place_name)
  end
end
