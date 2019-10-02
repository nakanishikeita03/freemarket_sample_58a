FactoryBot.define do
  factory :image do 
    image {File.open("#{Rails.root}/public/uploads/image/image/1/threelip.jpg")}
    association :product
  end
end