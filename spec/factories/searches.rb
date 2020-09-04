FactoryBot.define do

  factory :search do
    lunch_name      {"イタリアンベリー"}
    lunch_text      {"ランチの感想は普通でした。"}
    lunch_image     {"https://d1f5hsy4d47upe.cloudfront.net/2b/2b837a31797503e063fe3924f393a7a1_w.jpg"}
    lunch_address   {"大阪府大阪市港区弁天1-2-1"}
    lunch_link      {"https:aaaa"}
    dinner_name     {"リストランテプレンチ"}
    dinner_text     {"ディナーの感想はすごくよかった！"}
    dinner_image    {"https://d1f5hsy4d47upe.cloudfront.net/2b/2b837a31797503e063fe3924f393a7a1_w.jpg"}
    dinner_address  {"大阪府大阪市港区磯路2-11-18"}
    dinner_link     {"https:"}
    section1        {"1000"}
    section2        {"1000"}
    section3        {"1000"}
    section4        {"1000"}
    plan_comment    {"最高"}
    went_date       {"2020-10-12"}
    created_at      { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end