class StaticPagesController < ApplicationController
  require 'flickraw'
  def index


    render_photos
  end

  def home

  end


  private
    def popular_photos(user_id, count = 10)
        flickr.photos.getPopular(user_id: user_id,per_page: count)
    end
    def user_name

    end
    def render_photos
      @photos = popular_photos(params[:id])
      @photos.each_with_index do |photo,i|
        photo = flickr.photos.getInfo(:photo_id => @photos[i].id)
      end
      render 'static_pages/index', photos: @photos
    rescue StandardError
      render 'static_pages/unavailable'
    end  
end
