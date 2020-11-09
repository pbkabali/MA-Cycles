class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @like = helpers.current_user.likes.build(opinion_id: params[:id])

    if @like.save
      redirect_to request.referrer, alert: 'You have liked this post.'

    else
      redirect_to request.referrer, alert: 'Like was Not created'
    end
  end

  def destroy
    if @like.destroy
      redirect_to request.referrer, alert: 'You have disliked this post'
    else
      redirect_to request.referrer, alert: 'Like was NOT destroyed.'
    end
  end

  private

  def set_like
    @like = helpers.current_user.likes.find_by(opinion_id: params[:id])
  end
end
