class LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @links = Link.all
    respond_to do |format|
      format.html
      format.json { render :json => @links }
    end
  end

  def create
    respond_to do |format|
      format.html
      format.json { render :json => @link }
    end
    @link = Link.new(:shortcut => params[:shortcut],
                     :target => params[:target]
                    )
    @link.save!
  end

  def show
    @link
    if params[:shortcut]
      @link = Link.find_or_initialize_by_shortcut(params[:shortcut])
    else
      @link = Link.find(params[:id])
    end

    respond_to do |format|
      format.json { render :json => @link }
      format.html {
        if @link.new_record?
          render "create"
        else
          @link.update_attribute(:access_count, @link.access_count + 1)
          redirect_to @link.target + "/#{params[:path]}"
        end
      }
    end
  end
end
