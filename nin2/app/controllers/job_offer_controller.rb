class JobOfferController < ApplicationController

  def accept
    @offer = JobOffer.find(params[:id])

    respond_to do |format|
      if current_user.nil?
        format.html do
          self.successful_login_url_redirect = accept_job_offer_url(@offer)
          redirect_to new_user_session_url
        end
        format.json { render json: { success: false }, :errors => ["You Must Be Logged In"], location: new_user_session_url }
      elsif ! @offer.belongs_to?(current_user)
        @offer.close_others_pending
        @offer.status = :accepted
        @offer.save
        assignment = @offer.create_job_assignment
        format.html { redirect_to assignment, notice: 'Interpreter was successfully created.' }
        format.json { render json: assignment, status: :created, location: assignment }
      elsif @offer.is_pending?

      end
    end

  end

end