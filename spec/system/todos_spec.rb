require 'rails_helper'

RSpec.describe "Todos", type: :system do
  before do
    driven_by(:selenium_chrome)
  end

  it "enables user to add a new todo" do
    visit root_path

    fill_in "What needs to be done?", with: "Buy groceries"
    click_button "Add Todo"

    expect(page).to have_content("Buy groceries")
  end

  it "enables user to complete a todo" do
    Todo.create!(title: "Mow the lawn", completed: false)

    visit root_path
    click_button "Mark Complete"

    expect(page).to have_content("Mark Incomplete")

    # Check that it's crossed out (based on our CSS class applied)
    expect(page).to have_css(".todo-text.completed", text: "Mow the lawn")
  end

  it "enables user to delete a todo" do
    Todo.create!(title: "Walk the dog", completed: false)

    visit root_path
    expect(page).to have_content("Walk the dog")

    click_button "Delete"

    expect(page).not_to have_content("Walk the dog")
  end
end
