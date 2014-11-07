class PicturesController < ApplicationController
  
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @most_recent_pictures = Picture.page(@page)
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    
    if @picture.update_attributes(picture_params)
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    # @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

private

    def picture_params

      params.require(:picture).permit(:artist, :title, :url)

    end

    def set_picture
      @picture = Picture.find(params[:id])
    end

end


