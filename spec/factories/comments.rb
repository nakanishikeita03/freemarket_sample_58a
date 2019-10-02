FactoryBot.define do
  factory :comment do
      user_id               {"1"}
      product_id           {"1"}
      text                 {"お値下げ可能ですか？"}
      user
  end
end
