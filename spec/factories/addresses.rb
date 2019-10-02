FactoryBot.define do
  factory :address do
    user_id               {"1"}
    postal_code           {"111-1111"}
    prefecture            {"1"}
    city                  {"名古屋市"}
    street                {"瑞穂区"}
    building              {"ミッドランドスクエア"}
    l_name_kanji          {"中西"}
    f_name_kanji          {"啓太"}
    l_name_kana           {"ナカニシ"}
    f_name_kana           {"ケイタ"}
    user
  end
end