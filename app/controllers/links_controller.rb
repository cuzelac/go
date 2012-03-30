class LinksController < ApplicationController
  def index
    @links = Link.all
    respond_to do |format|
      format.html
      format.json { render :json => @links }
    end
  end

  def show
    @link
    if params[:shortcut]
      @link = Link.find_by_shortcut(params[:shortcut])
    else
      @link = Link.find(params[:id])
    end

    respond_to do |format|
      format.json { render :json => @link }
      format.html {
        @link.update_attribute(:access_count, @link.access_count + 1)
        redirect_to @link.target + "/#{params[:path]}"
      }
    end
  end
end
