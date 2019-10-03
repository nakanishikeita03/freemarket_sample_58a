require 'rails_helper'

describe Address do
  describe '#create' do
    it "postal_codeが空では登録不可" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "postal_codeがdate型データXXX-XXXXではない場合登録不可" do
      address = build(:address, postal_code: "1111-1111")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "prefectureが空では登録不可" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityが空では登録不可" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "streetが空では登録不可" do
      address = build(:address, street: "")
      address.valid?
      expect(address.errors[:street]).to include("を入力してください")
    end

    it "f_name_kanjiが空では登録不可" do
      address = build(:address, f_name_kanji: "")
      address.valid?
      expect(address.errors[:f_name_kanji]).to include("を入力してください")
    end

    it "f_name_kanjiが16文字以上だと登録不可" do
      address = build(:address, f_name_kanji: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      address.valid?
      expect(address.errors[:f_name_kanji][0]).to include("は15文字以内で入力してください")
    end

    it "l_name_kanjiが空では登録不可" do
      address = build(:address, l_name_kanji: "")
      address.valid?
      expect(address.errors[:l_name_kanji]).to include("を入力してください")
    end

    it "l_name_kanjiが16文字以上だと登録不可" do
      address = build(:address, l_name_kanji: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      address.valid?
      expect(address.errors[:l_name_kanji][0]).to include("は15文字以内で入力してください")
    end

    it "f_name_kanaが空では登録不可" do
      address = build(:address, f_name_kana: "")
      address.valid?
      expect(address.errors[:f_name_kana]).to include("を入力してください")
    end

    it "f_name_kanaが16文字以上だと登録不可" do
      address = build(:address, f_name_kana: "アアアアアアアアアアアアアアアア")
      address.valid?
      expect(address.errors[:f_name_kana][0]).to include("は15文字以内で入力してください")
    end

    it "l_name_kanaが空では登録不可" do
      address = build(:address, l_name_kana: "")
      address.valid?
      expect(address.errors[:l_name_kana]).to include("を入力してください")
    end

    it "l_name_kanaが16文字以上だと登録不可" do
      address = build(:address, l_name_kana: "アアアアアアアアアアアアアアアア")
      address.valid?
      expect(address.errors[:l_name_kana][0]).to include("は15文字以内で入力してください")
    end

  end
end