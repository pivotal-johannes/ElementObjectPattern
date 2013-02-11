class TaskPage < LoggedInPage
  attr_reader :name, :description

  def initialize(options={})
    super(Capybara.current_session)
    @name = options[:name]
    @description = options[:description]
  end

  def create_another_task
    click_link "Create another task"
    TasksPage.new
  end
end
