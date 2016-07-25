require 'rails_helper'

RSpec.feature "UserCanBeCreated", type: :feature do
  scenario "User can create a new user account" do
    # as a user
    # i visit the homepage and see "login" and create account
    visit root_path

    expect(page).to have_content("Login")
    expect(page).to have_content("Create New Account")
    # i click create account
    click_on "Create New Account"
    # i am taken to a new user form that asks for name and password
    # i fill in my name

    fill_in "Username", with: "Kristaps"
    # i fill in my password
    fill_in "Password", with: "36Latvia"
    # i click create account
    click_on "Create Account"
    # i am taken to my user dashboard
    expect(page).to have_content("Welcome, Kristaps!")
    expect(page).to have_content("Add New Idea")
    # user dashboard has a list of all ideas attached to my account
    # and a link to create a new idea

  end
end
