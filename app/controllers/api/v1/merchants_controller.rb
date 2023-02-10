class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show 
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def find_all
    
      render json: MerchantSerializer.new(merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%")
      .order(:name)
      )

  end
end