require 'rails_helper'

describe "Items API", type: :request do
  it "destroys an existing item" do
    create_list(:merchant, 14)
    create_list(:item, 10)

    item = Item.second

    expect(Item.count).to eq(10)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(9)
    expect(response).to have_http_status(204)
  end

  it "will delete a invoice if its the last item in the invoice" do
    create_list(:invoice_item, 10)


    item = Item.second

    expect(InvoiceItem.count).to eq(10)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(9)
  end
end