class EventsController < ApplicationController
  before_action :set_instances, only: [:show, :new, :create, :edit, :update]

  def index
    @events = Event.paginate(page: params[:page], per_page: 10).order("id DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
      flash[:notice] = "案件が投稿されました。"
    else
      render 'events/new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :start_day, :end_day, "work_start_time(4i)", "work_start_time(5i)", "work_end_time(4i)", "work_end_time(5i)", :prefecture_id, :address, :daily_wage, :detail, :position_id, :assign_num, :place_name)
  end

  def set_instances
    @prefectures = Prefecture.all
    @positions = Position.all
  end

end
