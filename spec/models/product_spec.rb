require 'rails_helper'

describe Product do
  describe '#create' do
    it "nameが空では登録不可" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "detailが空では登録不可" do
      product = build(:product, detail: "")
      product.valid?
      expect(product.errors[:detail]).to include("を入力してください")
    end

    it "categoryが空では登録不可" do
      product = build(:product, category: "")
      product.valid?
      expect(product.errors[:category]).to include("を入力してください")
    end

    it "priceが空では登録不可" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "statusが空では登録不可" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("を入力してください")
    end

    it "stateが空では登録不可" do
      product = build(:product, state: "")
      product.valid?
      expect(product.errors[:state]).to include("を入力してください")
    end

    it "cityが空では登録不可" do
      product = build(:product, city: "")
      product.valid?
      expect(product.errors[:city]).to include("を入力してください")
    end

    it "deliveryが空では登録不可" do
      product = build(:product, delivery: "")
      product.valid?
      expect(product.errors[:delivery]).to include("を入力してください")
    end
    
    it "delivery_timeが空では登録不可" do
      product = build(:product, delivery_time: "")
      product.valid?
      expect(product.errors[:delivery_time]).to include("を入力してください")
    end

    it "fee_payerが空では登録不可" do
      product = build(:product, fee_payer: "")
      product.valid?
      expect(product.errors[:fee_payer]).to include("を入力してください")
    end

    it "すべて満たしていれば登録可" do
      product = create(:product)
      expect(product).to be_valid
    end


  end
end