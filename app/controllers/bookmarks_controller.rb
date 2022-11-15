class BookmarksController < ApplicationController
  # BEFORE MOVING BOOKMARK FORM TO LIST SHOW
  # def new
  #   @bookmark = Bookmark.new
  #   @list = List.find(params[:list_id])
  # end

  def show
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
      # redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
