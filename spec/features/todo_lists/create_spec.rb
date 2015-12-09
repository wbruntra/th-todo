require 'rails_helper'

describe "Creating todo lists" do
  it "redirects to the todo list index page on success" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New Todo List")

    fill_in "Title", with: "Bills todo list"
    fill_in "Description", with: "this is what I am doing today"
    click_button "Create Todo list"

    expect(page).to have_content("Bills todo list")
  end
    
  it "displays an error when the todo list has no title" do
    expect(TodoList.count).to eq(0)
    
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New Todo List")

    fill_in "Title", with: ""
    fill_in "Description", with: "this is what I am doing today"
    click_button "Create Todo list"

    expect(page).to have_content("error")
    
    visit "/todo_lists"
    expect(page).to_not have_content("this is what I am doing today")
  end
  
  it "displays an error when the todo list has a title with less than 3 characters" do
    expect(TodoList.count).to eq(0)
    
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New Todo List")

    fill_in "Title", with: "Hi"
    fill_in "Description", with: "Another thing I am doing"
    click_button "Create Todo list"

    expect(page).to have_content("error")
    
    visit "/todo_lists"
    expect(page).to_not have_content("Another thing I am doing")
  
  end
  
end
