class ApplicantsController < ApplicationController

  def create
    Applicant.create(applicant_params)
    redirect_to event_path(params[:event_id]), notice: "案件にエントリーしました。"
  end

  def destroy
    if Applicant.destroy(params[:id])
      redirect_to event_path(params[:event_id]), notice: "エントリーを取り消しました。"
    else
      render 'events/show'
    end
  end


  private

  def applicant_params
    params.permit(:applicant_user_id, :event_id)
  end

end
