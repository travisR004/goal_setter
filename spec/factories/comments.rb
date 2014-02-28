# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body "MyString"
    commentable_id 1
    commentable_type "MyString"
    author_id 1
  end
end
