class TracksController < ApplicationController

    def new
        render :new
    end

    def edit
        render :edit
    end

    def show
        @track = Track.find(params[:id])
        render :show
    end

    def create
        @new_track = Track.new(track_params)
        @album = Album.where(id: @new_track.album_id)
        if @new_track.save!
            redirect_to album_url()
        else
            render :new
        end
    end

    def update

    end

    def destroy

    end

    private
    def track_params
        params.require(:track).permit(:title, :ord, :is_regular)
    end
end
