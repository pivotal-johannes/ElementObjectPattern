class PageObjectBase < Delegator
  include Rails.application.routes.url_helpers

  def initialize(page=Capybara.current_session)
    super
    @page = page
  end

  def __getobj__
    @page
  end

  def __setobj__(page)
    @page = page

  end

  def flash
    Flash.new
  end
end
