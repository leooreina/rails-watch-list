class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save

    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @bookmark = @list.bookmarks.first
    @bookmark.destroy

    redirect_to list_path(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
