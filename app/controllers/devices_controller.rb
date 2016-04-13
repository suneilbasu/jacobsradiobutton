class DevicesController < ApplicationController
before_action :authenticate_user!
  def index
  	@devices = Device.all
  end
  def show
  	@devices = Device.find(params[:id])
  end
  def edit
  	@devices = Device.find(params[:id])

  end
  def update
  	@devices = Device.find(params[:id])
  	if @devices.update(device_params)
  		redirect_to :action => 'index'
  	end
  end
  def destroy
  	Device.find(params[:id]).destroy
  	redirect_to :action =>'index'
  end
  def device_params
  	params.require(:device).permit(:device_name,:device_manufacturer,:device_type,:device_model,:user_id,:start_date,:expiry_date,:device_cost)
  end
  def create
  @devices = Device.new(device_params)
 if @devices.save
    flash[:notice]="Correct"
  redirect_to :action =>'index'
else
    flash[:title]=@devices.errors.full_messages.to_sentence
    render(:action=>'new')
end
end

private
  def Device_params
    params.require(:device).permit(:device_name,:device_type,:device_manufacturer,:device_model,:user_id,:start_date,:expiry_date, :device_cost)
end
end
