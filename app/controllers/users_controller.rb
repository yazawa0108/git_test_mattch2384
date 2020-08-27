class UsersController < ApplicationController

  def index
    @users = User.active
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(owner_id: current_user.id)
    @array = []
    @events.each do |event|
      event.applicants.each do |applicant|
        @array << applicant.applicant_user_id
      end
    end
  end

  private

end
