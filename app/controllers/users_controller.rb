class UsersController < ApplicationController
  before_action :authenticate_user!
    def index
    	@users = User.all
      authorize User
    end
    def show
      authorize User
    	@user = User.find(params[:id])
        @devices = @user.devices
    end
    def edit
      authorize User
    	@user = User.find(params[:id])
    end
    def update
      authorize User
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    		redirect_to :action => 'index'
    	end
    end
    def destroy
      authorize User
    	User.find(params[:id]).destroy
    	redirect_to :action =>'index'
    end
    def user_params
    	params.require(:user).permit(:email,:first_name,:last_name,:role,:office_location)
    end

    def create
    @users = User.new(user_params)
   if @users.save
      flash[:notice]="Correct"
    redirect_to :action =>'index'
  else
      flash[:title]=@users.errors.full_messages.to_sentence
      render(:action=>'new')
  end
  end

  private
    def user_params
      params.require(:user).permit(:email,:first_name,:last_name,:role,:office_location)
  end
  end
