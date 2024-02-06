class ItempurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if @item.item_purchase.present?
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @itempurchase_purchase = ItempurchasePurchase.new
    end
  end

  def create
    @itempurchase_purchase = ItempurchasePurchase.new(itempurchasepurchase_params)
    #@item = Item.new(item_params)
    if @itempurchase_purchase.valid?
       pay_item
       @itempurchase_purchase.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def itempurchasepurchase_params
    @item = Item.find(params[:item_id])
    params.require(:itempurchase_purchase).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

def pay_item
  Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
  @item = Item.find(params[:item_id])
  Payjp::Charge.create(
    amount: @item.price,
    card: itempurchasepurchase_params[:token],
    currency: 'jpy'
  )
end