FactoryBot.define do

  factory :user do
    nickname              {"けいた"}
    f_name_kanji          {"中西"}
    l_name_kanji          {"啓太"}
    f_name_kana           {"ナカニシ"}
    l_name_kana           {"ケイタ"}
    birthday              {"1996-03-08"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    tel             {"090"}
  end

end