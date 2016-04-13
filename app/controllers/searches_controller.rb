class SearchesController < ApplicationController
before_action :authenticate_user!
	def new
		@search = Search.new
		@device_type = Device.uniq.pluck(:device_type)
    @device_manufacturer = Device.uniq.pluck(:device_manufacturer)
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private
	def search_params
		params.require(:search).permit(:device_name, :device_type, :device_model, :start_date, :expiry_date, :expiry_date_min, :start_date_min, :min_price, :max_price, :device_manufacturer)
	end
end
