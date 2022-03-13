class BookmarksController < ApplicationController
  before_action :login_check
  before_action :onsen_params
  before_action :authenticate_user!
  def create
    Bookmark.create(user_id: current_user.id, onsen_id: params[:id])
  end

  def destroy
    Bookmark.find_by(user_id: current_user.id, onsen_id: params[:id]).destroy
  end

  private

  def onsen_params
    @onsen = Onsen.find(params[:id])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_user_session_path
    end
  end
end
