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

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was deleted successfully."
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = "There was an error deleting the item."
      redirect_to user_path(current_user.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:user_id)
  end
end
