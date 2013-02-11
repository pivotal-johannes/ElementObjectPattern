require 'feature_helper'

describe "working with tasks", type: :feature do
  before do
    Task.destroy_all
    User.destroy_all
  end

  it "allows a logged in user to create tasks", js: true do
    tasks_page = LoginPage.default_login.navigate("Tasks")

    created_task_page = tasks_page.create_task(
        name: "Task Name",
        description: "The task description"
    )

    expect(created_task_page).to have_content("Task Name")
    expect(created_task_page).to have_content("The task description")
  end

  it "allows a user to delete a task from the tasks view", js: :true do
    home_page = LoginPage.default_login

    first_task_page = home_page.navigate("Tasks").create_task(
        name: "Task Name 1",
        description: "The task description"
    )

    second_task_page = home_page.navigate("Tasks").create_task(
        name: "Task Name 2",
        description: "Another description"
    )

    tasks_grid = second_task_page.navigate("Tasks").tasks_grid

    expect(tasks_grid).to have_content "Task Name 1"
    expect(tasks_grid).to have_content "Task Name 2"
  end
end
