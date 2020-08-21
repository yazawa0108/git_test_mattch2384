class ApplicantsController < ApplicationController

  def create
    Applicant.create(applicant_params)
    redirect_to event_path(params[:event_id])
  end

  def destroy
    if Applicant.destroy(params[:id])
      redirect_to event_path(params[:event_id])
    else
      render 'events/show'
    end
  end


  private

  def applicant_params
    params.permit(:applicant_user_id, :event_id)
  end

end
