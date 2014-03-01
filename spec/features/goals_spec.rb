require 'spec_helper'

feature "users" do
  before(:each) do
    sign_up
    visit new_goal_url
    fill_in "Title", with: "Test Goal"
    fill_in "Details", with: "Lorem Ipsum"
    choose('Private')
    click_on "Create Goal"
    visit root_url
  end

  it "should be able to create a goal" do
    expect(page).to have_link "Test Goal"
  end

  it "cant see other private goals" do
    click_on "Sign Out"
    visit new_user_url
    sign_up
    expect(page).to_not have_content "Test Goal"
  end

  context "test goal" do
    before(:each) do
      click_on "Test Goal"
    end

  it "should be able to see a goal" do
    expect(page).to have_content "Lorem Ipsum"
  end

  it "should be able to edit a goal it owns" do
    click_on "Edit Goal"
    fill_in "Details", with: "Updated Goal"
    click_on "Update Goal"
    expect(page).to have_content "Updated Goal"
  end

  it "can destroy its own goals" do
    click_on "Destroy Goal"
    expect(page).to_not have_content "Test Goal"
  end

  it "can mark goals as completed" do
    click_on "Complete!"
    expect(page).to have_content "Congratulations"
  end
end

