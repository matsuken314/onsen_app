class BookmarksController < ApplicationController
  before_action :onsen_params, :authenticate_user!
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
end
