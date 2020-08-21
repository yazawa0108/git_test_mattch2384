class EventsController < ApplicationController
  before_action :set_instances

  def index
    @events = Event.paginate(page: params[:page], per_page: 10).order("id DESC")
    @user = current_user
  end

  def show
    @event = Event.find(params[:id])
    @owner = User.find(@event.owner_id)
    # そのイベントにエントリーしたユーザーを配列で代入
    @applicants = Applicant.where(event_id: @event.id)
    if user_signed_in?
      # events/showにアクセスしているユーザーがエントリー済みの場合、そのレコードを配列で代入
      @applicant = Applicant.where(applicant_user_id: current_user.id).where(event_id: @event.id).first
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: "案件が投稿されました。"
    else
      render 'events/new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @applicants = Applicant.where(event_id: @event.id)
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id), notice: "案件が更新されました。"
    else
      render 'events/edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path, notice: "案件が削除されました。"
  end


  private

  def event_params
    params.require(:event).permit(:name, :start_day, :end_day, "work_start_time(4i)", "work_start_time(5i)", "work_end_time(4i)", "work_end_time(5i)", :prefecture_id, :address, :daily_wage, :detail, :position_id, :assign_num, :place_name, :event_status_id).merge(owner_id: current_user.id)
  end

  def set_instances
    @prefectures = Prefecture.all
    @positions = Position.all
  end

end
