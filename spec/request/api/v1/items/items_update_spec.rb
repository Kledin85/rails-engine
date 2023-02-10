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
    
    describe 'sad paths' do
      it 'has error 404 when id is not valid' do
        merchant_1 = Merchant.create!(name: "merchant_1")
        item_1 = Item.create!(name: "item_1", description: "the description", unit_price: 50, merchant_id: merchant_1.id)
        
        
      item_params = ({
        "name": "value1",
        "description": "value2",
        "unit_price": 100.99,
        "merchant_id": 25
      })
      headers = {"CONTENT_TYPE" => "application/json"}
      patch "/api/v1/items/#{item_1.id}", headers: headers, params: JSON.generate(item: item_params)
      
      error = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_unsuccessful
    end
  end
end