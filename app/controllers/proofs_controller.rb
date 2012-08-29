class ProofsController < ApplicationController

  def show
    @proof = Proof.find params[:id]
  end
end
