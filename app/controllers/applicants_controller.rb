class ApplicantsController < ApplicationController

  def create
    Applicant.create(applicant_params)
    redirect_to events_path
  end


  private

  def applicant_params
    params.require(:applicant).permit(:applicant_user_id, :event_id)
  end

end
