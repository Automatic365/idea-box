require 'rails_helper'

RSpec.feature "UserCanLogouts", type: :feature do
  scenario "user with an account can log in" do

    user = User.create(username: "Kristaps", password: "36Latvia")

    visit root_path

    click_on "Login"

    fill_in "Username", with: "Kristaps"
    fill_in "Password", with: "36Latvia"

    click_on "Login"

    expect(page).to have_content("Welcome, Kristaps!")

    click_on "Logout"

    expect(page).to have_content("Welcome to Idea Box")
  end
end
