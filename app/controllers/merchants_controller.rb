class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
  end

  def create
    @merchant = Merchant.create(merchant_params)
    
    redirect_to "/merchants"
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    @merchant = Merchant.update(merchant_params)
    @merchant = Merchant.find(params[:id])

    redirect_to "/merchants/#{@merchant.id}"
  end

  def destroy
    Merchant.destroy(params[:id])
    redirect_to '/merchants'

  end

  private
  def merchant_params
    params.permit(:name, :address, :city, :zip, :state)
  end
end
