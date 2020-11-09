class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]

  def index
    @opinion = Opinion.new
    @opinions = Opinion.all.includes(:author).order('created_at DESC')
    @users = User.all - helpers.current_user.following - [helpers.current_user]
  end

  def create
    @opinion = Opinion.new(AuthorId: session[:user_id], Text: opinion_params[:Text])

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to opinions_path, notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:Text)
  end
end
