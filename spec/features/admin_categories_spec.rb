require 'rails_helper'

RSpec.feature "AdminCategories", type: :feature do
  scenario "user can see categories index" do

    admin = User.create(username: "Kristaps", password: "36Latvia", role: 1)

    visit root_path
    click_on "Login"

    fill_in "Username", with: admin.username
    fill_in "Password", with: "36Latvia"

    click_on "Login"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    expect(page).to have_content("Admin Categories")

  end


  scenario "admin can add categories" do

    admin = User.create(username: "Kristaps", password: "36Latvia", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    expect(page).to have_content("Add New Category")

    click_on "Add New Category"

    fill_in "Title", with: "Automotive"
    click_on "Submit Category"
    expect(page).to have_content("Automotive")

  end




end
