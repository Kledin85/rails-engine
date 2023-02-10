class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    new_item = Item.create(item_params)
    render json: ItemSerializer.new(new_item)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    render json: ItemSerializer.new(item)
  end

  def destroy
    item = Item.find(params[:id])
    item.invoices.each do |invoice| 
      if invoice.delete_with_last_item? == true
        invoice.invoice_items.each do |ii|
            ii.destroy
          end
          invoice.destroy
        end
      end

    item.destroy
  end

  def find
    # binding.pry
    if params[:name]
    render json: ItemSerializer.new(item = Item.where('name ILIKE ?', "%#{params[:name]}%")
    .order(:name)
    .first)
    elsif params[:max_price] && params[:min_price]
      render json: ItemSerializer.new(item = Item.where('unit_price >= ?', "#{params[:min_price]}").where('unit_price <= ?', "#{params[:max_price]}").first)
    elsif params[:min_price]
      render json: ItemSerializer.new(item = Item.where('unit_price >= ?', "#{params[:min_price]}").first)
    elsif params[:max_price]
      render json: ItemSerializer.new(item = Item.where('unit_price <= ?', "#{params[:max_price]}").first)
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end