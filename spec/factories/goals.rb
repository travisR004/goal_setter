# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    title "MyString"
    details "MyText"
    user_id 1
    pub_priv "MyString"
  end
end
