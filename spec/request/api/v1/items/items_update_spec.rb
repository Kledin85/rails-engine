require 'rails_helper'

describe "Items API", type: :request do
  it "updates an existing item" do
    create_list(:merchant, 14)
    create_list(:item, 10)

    id = Item.first.id
    merchant_id = Merchant.first.id
    item_params = ({
      "name": "value1",
      "description": "value2",
      "unit_price": 100.99,
      "merchant_id": merchant_id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate(item: item_params)

    item = Item.find_by(id: id)


   expect(response).to be_successful
   expect(item.name).to eq(item_params[:name])
   expect(item.description).to eq(item_params[:description])
   expect(item.unit_price).to eq(item_params[:unit_price])
   expect(item.merchant_id).to eq(item_params[:merchant_id])
  end
end