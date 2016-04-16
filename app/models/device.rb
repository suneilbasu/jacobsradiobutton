class Device < ActiveRecord::Base
  	validates :expiry_date, presence: {message:"Expiry Date is missing"}
  	validates :start_date, presence: {message:"Start Date is missing"}
  	validates :device_name, presence: {message:"Device Name is missing"}
  	validates :device_type, presence: {message:"Device Type is missing"}
  	validates :device_model, presence: {message:"Device Model is missing"}
  belongs_to :user

  def reaching_end
    
  end
end
