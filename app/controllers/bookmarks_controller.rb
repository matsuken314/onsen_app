class BookmarksController < ApplicationController
  before_action :onsen_params

  def bookmark
    bookmark = current_user.bookmarks.new(onsen_id: @onsen.id)
    bookmark.save
  end

  def unbookmark
    bookmark = current_user.bookmarks.find_by(onsen_id: @onsen.id)
    bookmark.destroy
  end

  private

  def onsen_params
    @onsen = Onsen.find(params[:onsen_id])
    @id_name = "#bookmark-link-#{@onsen.id}"
  end
end
