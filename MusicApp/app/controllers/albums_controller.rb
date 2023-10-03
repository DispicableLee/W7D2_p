class AlbumsController < ApplicationController
    before_action :require_login, only: [:new, :create]
    def new
        render :new
    end

    def show
        @album = Album.find(params[:id])
        @tracks = Track.where(band_id: @album.id)
        render :show
    end

    def create
        @new_album = Album.new(album_params)
        @new_album.band_id = params[:band_id]
        if @new_album.save!
            redirect_to band_url(params[:band_id])
        else
            flash.now[:errors] = @new_album.errors.full_messages
            render :new, status: 422 
        end
    end




    private
    def album_params
        params.require(:album).permit(:title, :year, :is_studio_recording)
    end
end
