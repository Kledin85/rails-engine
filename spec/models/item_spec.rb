require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :merchant_id }
  end
  describe "relationships" do
    it { should have_many(:invoices).through(:invoice_items) }
    it { should belong_to :merchant }
  end
    
  # it '#delete_item' do
  #   create_list(:merchant, 10)
  #   create_list(:invoice_item, 12)

  #   item = Item.all.shuffle.shuffle.first
  #   invoices = item.invoices
  #   expect(Item.all.length).to eq(12)

  #   item.delete_item

  #   expect(Item.all.length).to eq(11)
  #   # binding.pry
  #   # invoices.each do |invoice|
  #   #   invoice.delete if invoice.items.length == 1
  #   # end
  #   # end

  #   # item.delete_item


  # end
end
