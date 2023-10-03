class UsersController < ApplicationController
    before_action :require_login

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @new_user = User.new(user_params)
        if @new_user.save!
            redirect_to user_url(@new_user)
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
