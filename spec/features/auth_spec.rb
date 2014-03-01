require 'spec_helper'

feature "Sign Up" do
  before(:each) do
    visit new_user_url
    fill_in 'Username', with: "test_user"
    fill_in 'Password', with: "password"
  end

  it "has a user sign up page" do
    expect(page).to have_content "Sign Up"
  end

  it "redirects to the home page" do
    click_on "Sign Up"
    expect(page).to have_content "Goals"
  end

  it "logs in a user on sign up" do
    click_on "Sign Up"
    expect(page).to have_content "test_user"
  end
end

feature "Log In" do
  before(:each) do
    visit new_user_url

    click_on "Sign Out"
    fill_in 'Username', with: "test_user"
    fill_in 'Password', with: "password"
    click_on "Sign In"
  end

  it "shows a username on the homepage after login" do
    expect(page).to have_content "test_user"
  end

end

feature "Log Out" do
  it "begins with logged out state" do
    visit root_url
    expect(page).to have_link "Log In"
  end

  it "doesn't show username after logout" do
    sign_up
    click_on "Sign Out"
    visit root_url
    expect(page).to_not have_content "test_user"
    expect(page).to have_link "Log In"
  end
end