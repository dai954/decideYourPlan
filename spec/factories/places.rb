FactoryBot.define do

  factory :place do

    name              {"テーマパーク"}
    address           {"大阪府大阪市港区１−１−１"}
    link              {"https:aaaaa"}
    image             {File.open("#{Rails.root}/public/images/test_image.jpg")}
    prefecture        {"大阪府"}
    description       {Faker::Lorem.sentence}
    
  end

end