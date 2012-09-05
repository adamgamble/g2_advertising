class ProofsController < ApplicationController

  def show
    @proof = Proof.find params[:id]
  end

  def update
    @proof = Proof.find params[:id]
    @proof.update_attributes(params["proof"])
    if @proof.save
      case params["approval"]
      when "no_changes"
        flash[:alert] = "Your proof is marked ready for print!"
        @proof.ready_for_print!
        redirect_to "/" and return
      when "approved_with_changes"
        flash[:alert] = "Your proof is ready for print pending changes!"
        @proof.approved_pending_changes!
        redirect_to "/" and return
      when "resubmit_proof"
        flash[:alert] = "Your proof will be resubmitted with the changes requested!"
        @proof.resubmit_with_changes!
        redirect_to "/" and return
      end
    else
      flash[:alert] = "There were errors saving your proof"
      render :action => "show" and return
    end
  end
end
