class TasksPage < LoggedInPage
  def create_task(attrs)
    click_on "New Task"

    fill_in "Name", with: attrs[:name]
    fill_in "Description", with: attrs[:description]

    click_on "Create Task"
    TaskPage.new(name: attrs[:name], description: attrs[:description])
  end

  def tasks_grid
    ElementObject.new(find("#tasks"))
  end
end
