FactoryBot.define do


  factory :product do
    user_id               {"1"}
    name                  {"LGTM祈願のマフラー"}
    detail                {"これをきつく巻けば巻くほどLGTMが出やすくなります"}
    category              {"1"}
    price                 {"1000"}
    status                {"0"}
    state                 {"1"}
    city                  {"1"}
    delivery              {"1"}
    delivery_time         {"3"}
    fee_payer             {"0"}

    user
    
  end

end
