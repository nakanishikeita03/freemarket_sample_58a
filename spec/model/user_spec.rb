require 'rails_helper'

describe User do
  describe '#create' do
    it "nicknameが空では登録不可" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "nicknameが16文字以上だと登録不可" do
      user = build(:user, nickname: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end
    it "emailが空では登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "emailが重複すると登録不可" do
      create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "passwordが空だと登録不可" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "password_confirmationが空だと登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "passwordが7文字未満だと登録不可" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
    it "f_name_kanjiが空だと登録不可" do
      user = build(:user, f_name_kanji: nil)
      user.valid?
      expect(user.errors[:f_name_kanji]).to include("can't be blank")
    end
    it "f_name_kanjiが16文字以上だと登録不可" do
      user = build(:user, f_name_kanji: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      user.valid?
      expect(user.errors[:f_name_kanji][0]).to include("is too long")
    end
    it "f_name_kanjiに漢字以外が含まれると登録不可 " do
      user = build(:user, f_name_kanji: "亜亜a")
      user.valid?
      expect(user.errors[:f_name_kanji][0]).to include("is invalid")
    end
    it "l_name_kanjiが空だと登録不可" do
      user = build(:user, l_name_kanji: nil)
      user.valid?
      expect(user.errors[:l_name_kanji]).to include("can't be blank")
    end
    it "l_name_kanjiが16文字以上だと登録不可" do
      user = build(:user, l_name_kanji: "亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜亜")
      user.valid?
      expect(user.errors[:l_name_kanji][0]).to include("is too long")
    end
    it "l_name_kanjiに漢字以外が含まれると登録不可 " do
      user = build(:user, l_name_kanji: "亜亜a")
      user.valid?
      expect(user.errors[:l_name_kanji][0]).to include("is invalid")
    end
    it "f_name_kanaが空だと登録不可" do
      user = build(:user, f_name_kana: nil)
      user.valid?
      expect(user.errors[:f_name_kana]).to include("can't be blank")
    end
    it "f_name_kanaが16文字以上だと登録不可" do
      user = build(:user, f_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:f_name_kana][0]).to include("is too long")
    end
    it "f_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, f_name_kana: "カナa")
      user.valid?
      expect(user.errors[:f_name_kana][0]).to include("is invalid")
    end
    it "l_name_kanaが空だと登録不可" do
      user = build(:user, l_name_kana: nil)
      user.valid?
      expect(user.errors[:l_name_kana]).to include("can't be blank")
    end
    it "l_name_kanaが16文字以上だと登録不可" do
      user = build(:user, l_name_kana: "アアアアアアアアアアアアアアアア")
      user.valid?
      expect(user.errors[:l_name_kana][0]).to include("is too long")
    end
    it "l_name_kanaにカナ以外が含まれると登録不可 " do
      user = build(:user, l_name_kana: "カナa")
      user.valid?
      expect(user.errors[:l_name_kana][0]).to include("is invalid")
    end
    it "birthdayが空だと登録不可" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
    it "birthdayがdate型データXXXX-XX-XXではない場合登録不可 " do
      user = build(:user, birthday: 1989)
      user.valid?
      expect(user.errors[:birthday][0]).to include("is invalid")
    end
    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end

  end
end