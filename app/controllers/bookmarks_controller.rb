class BookmarksController < ApplicationController
  def create
    Bookmark.create(user_id: current_user.id, onsen_id: params[:id])
    redirect_to onsens_path
  end

  def destroy
    Bookmark.find_by(user_id: current_user.id, onsen_id: params[:id]).destroy
    redirect_to onsens_path
  end
end
