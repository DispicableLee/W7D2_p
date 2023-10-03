class BandsController < ApplicationController
    before_action :require_login, only: [:new, :create]
    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find(params[:id])
        @albums = Album.where(band_id: @band.id)
        render :show
    end

    def new
        render :new
    end 

    def create
        @new_band = Band.new(band_params)
        if @new_band.save!
            redirect_to band_url(@new_band)
        else
            @new_band = Band.new
            render :new
        end
    end
    

    def edit
        render :edit
    end

    def update

    end

    def destroy

    end


    private
    def band_params
        params.require(:band).permit(:name)
    end


    def set_band
        @band = Band.find(params[:id])
    end


end
