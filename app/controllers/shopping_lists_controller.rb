class ShoppingListsController < ApplicationController

  def edit
    @shopping_list = ShoppingList.find(params[:id])
    @shopping_list.plan = Plan.find(@shopping_list.plan_id)

  end

  def update
    @shopping_list = ShoppingList.find(params[:id])
    if @shopping_list.update(shopping_list_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to plan_path(@shopping_list.plan), notice: "Shopping list updated." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@shopping_list, partial: "shopping_lists/item", locals: { shopping_list: @shopping_list }) }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def batch_update
    shopping_lists = params[:shopping_lists]
    shopping_lists.each do |id, attributes|
      shopping_list = ShoppingList.find(id)
      shopping_list.update(attributes)
    end
    head :ok
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:quantity)
  end
end
