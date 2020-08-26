class UsersController < ApplicationController

  def index
    @users = User.all
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
    # @applicants = Applicant.where(applicant_user_id: @user.id)
    # @owners = []
    # @applicants.each do |applicant|
      # @owners << Event.where(id: applicant.event_id).owner_id
    # end
  end

  private

end
