class ElementObject < Delegator
  include Rails.application.routes.url_helpers

  def self.element(options)
    @@selector = options[:css]
  end

  def initialize(page=nil)
    element = page || Capybara.current_session.find(@@selector)
    super(element)                  # pass obj to Delegator constructor, required
    @delegate_sd_obj = element # store obj for future use
  end

  def __getobj__
    @delegate_sd_obj # return object we are delegating to, required
  end

  def __setobj__(obj)
    @delegate_sd_obj = obj # change delegation object,
                           # a feature we're providing
  end
end
