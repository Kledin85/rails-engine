require 'rails_helper'

describe "Items API", type: :request do
  it "creates a new item" do
    create_list(:merchant, 14)
    id = Merchant.first.id
    item_params = ({
      "name": "value1",
      "description": "value2",
      "unit_price": 100.99,
      "merchant_id": id
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)

    created_item = Item.last

   expect(response).to be_successful
   expect(created_item.name).to eq(item_params[:name])
   expect(created_item.description).to eq(item_params[:description])
   expect(created_item.unit_price).to eq(item_params[:unit_price])
   expect(created_item.merchant_id).to eq(item_params[:merchant_id])
  end
end