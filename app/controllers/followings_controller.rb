class FollowingsController < ApplicationController
  before_action :set_following, only: [:destroy]

  def create
    @following = helpers.current_user.following_relationships.build(FollowedId: params[:id])

    if @following.save
      redirect_to request.referrer, alert: 'Following was successfully created.'
    else
      redirect_to request.referrer, alert: 'Following was NOT created.'
    end
  end

  def destroy
    if @following.destroy
      redirect_to request.referrer, alert: 'Following was successfully destroyed.'
    else
      redirect_to request.referrer, alert: 'Following was NOT destroyed.'
    end
  end

  private

  def set_following
    @following = helpers.current_user.following_relationships.find_by(FollowedId: params[:id])
  end
end
