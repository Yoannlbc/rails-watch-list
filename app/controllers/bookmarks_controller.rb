class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
  end

#   def destroy
#     @bookmark = Bookmark.find(params[:id])
#     @bookmark.destroy
#     redirect_to lists_path, status: :see_other
#   end
# end

private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
