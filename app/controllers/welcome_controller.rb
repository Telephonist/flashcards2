# :nodoc:
class WelcomeController < ApplicationController
  def index
    @card = Card.for_review.first
  end

  def check_translation
    @card = Card.find(params[:check_translation][:id])
    if @card.correctly_translated(params[:check_translation][:user_input])
      @card.update_review_date
      flash[:notice] = "true"
    else
      flash[:alert] = "false"
    end
    redirect_to root_path
  end
end
