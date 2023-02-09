require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { should validate_presence_of :status }
    it { should validate_presence_of :customer_id }
  end
  describe "relationships" do
    it { should belong_to :customer }
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:merchants).through(:items) }
    it { should have_many :transactions}
  end

  it '#delete_with_last_item?' do
    create_list(:merchant, 10)
    create_list(:invoice_item, 12)

    invoice = Invoice.all.shuffle.shuffle.first
    
    expect(Invoice.all.length).to eq(12)
    
    expect(invoice.delete_with_last_item?).to be_in([true, false])
  end
end
