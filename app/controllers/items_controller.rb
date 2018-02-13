class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item was added successfully."
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = "Error saving item. Please try again."
      redirect_to user_path(current_user.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:user_id)
  end
end
