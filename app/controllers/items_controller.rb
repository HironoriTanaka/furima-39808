class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if user_signed_in?
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    if user_signed_in?
      if current_user.id != @item.user_id
      @item.destroy
      redirect_to root_path
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
