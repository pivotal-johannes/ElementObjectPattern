class ElementObject < Delegator
  include Rails.application.routes.url_helpers

  def self.element(options)
    @@selector = options[:css]
  end

  def initialize(page=nil)
    element = page || Capybara.current_session.find(@@selector)
    super(element)
    @element = element
  end

  def __getobj__
    @element
  end

  def __setobj__(obj)
    @element = obj
  end
end
