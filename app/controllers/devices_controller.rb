class DevicesController < ApplicationController
before_action :authenticate_user!
  def index
  	   @devices = Device.all
  end
  def show
    authorize Device
  	@devices = Device.find(params[:id])
  end
  def edit
    authorize Device
  	@devices = Device.find(params[:id])
  end
  def update
    authorize Device
  	@devices = Device.find(params[:id])
  	if @devices.update(device_params)
  		redirect_to :action => 'index'
      flash[:notice]="Successfully Changed"
  	end
  end
  def destroy
    authorize Device
  	Device.find(params[:id]).destroy
  	redirect_to :action =>'index'
  end
  def device_params
    authorize Device
  	params.require(:device).permit(:device_name,:device_manufacturer,:device_type,:device_model,:user_id,:start_date,:expiry_date,:device_cost)
  end
  def create
    authorize Device
  @devices = Device.new(device_params)
 if @devices.save
    flash[:notice]="Successfully Created New User"
  redirect_to :action =>'index'
else
    flash[:title]=@devices.errors.full_messages.to_sentence
    render(:action=>'new')
end
end

private
  def Device_params
    authorize Device
    params.require(:device).permit(:device_name,:device_type,:device_manufacturer,:device_model,:user_id,:start_date,:expiry_date, :device_cost)
end
end
