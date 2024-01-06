class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @item.item_imgs.new
    @category_parent = Category.where(ancestry: nil)
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
  end
end
