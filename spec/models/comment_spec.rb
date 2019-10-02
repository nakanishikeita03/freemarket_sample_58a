require 'rails_helper'

describe Comment do
  describe '#create' do
    it "textが空では登録不可" do
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

    it "textが不適切ワードでは登録不可" do
      comment = build(:comment, text: "アホ")
      comment.valid?
      expect(comment.errors[:text]).to include("に不適切な単語が含まれています")
    end
  end
end
