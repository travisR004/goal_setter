require 'spec_helper'

feature "Comment" do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: "test_user"
    fill_in 'Password', with: "password"
    click_on "Sign Up"
    visit new_goal_url
    fill_in "Title", with: "Test Goal"
    fill_in "Details", with: "Lorem Ipsum"
    choose('Private')
    click_on "Create Goal"
    visit user_url(User.all.last)
  end

  it "can be made on a user" do
    fill_in "Comment", with: "Test Comment"
    click_on "Add Comment"
    expect(page).to have_content "Test Comment"
  end

  it "can be made on a goal" do
    click_on "Test Goal"
    fill_in "Comment", with: "Test Comment 2"
    click_on "Add Comment"
    expect(page).to have_content "Test Comment 2"
  end
end