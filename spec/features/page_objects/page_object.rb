class PageObjectBase < Delegator
  include Rails.application.routes.url_helpers

  def initialize(page=Capybara.current_session)
    super
    @delegate_sd_obj = page
  end

  def __getobj__
    @delegate_sd_obj # return object we are delegating to, required
  end

  def __setobj__(obj)
    @delegate_sd_obj = obj # change delegation object,
                           # a feature we're providing
  end

  def flash
    Flash.new
  end
end
