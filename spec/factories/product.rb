FactoryBot.define do


  factory :product do
    user_id               {"1"}
    name                  {"LGTM祈願のマフラー"}
    detail                {"これをきつく巻けば巻くほどLGTMが出やすくなります"}
    category              {"1"}
    price                 {"1000"}
    status                {"1"}
    state                 {"1"}
    city                  {"1"}
    delivery              {"1"}
    delivery_time         {"1"}
    fee_payer             {"1"}
    images {[
      FactoryBot.build(:image, product: nil)  #itemと同時にimage作成
    ]}
    user
    
  end

end
