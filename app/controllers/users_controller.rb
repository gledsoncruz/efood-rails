class UsersController < ApplicationController
	#before_action :set_user, only: [:show]
    def index
	   @users = User.all
        authorize @users
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.create( user_params )
    end
    def new
        @user = User.new
    end

    private

    # Use strong_parameters for attribute whitelisting
    # Be sure to update your create() and update() controller methods.

    def user_params
        params.require(:user).permit(:avatar)
    end
end
