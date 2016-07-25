require 'rails_helper'

RSpec.feature "UserCanCreateIdeas", type: :feature do
  scenario "user tries to add new idea" do

    category = Category.create(title: "Automotive")
    visit new_idea_path

    fill_in "Name", with: "Idea 1"
    fill_in "Description", with: "I want to make sure this works"
    select(category.title, from: 'Category')

    click_button "Create Idea"

    expect(page).to have_content("Idea 1")


  end
end
