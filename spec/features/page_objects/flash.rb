class Flash < ElementObject
  element css: ".flash"

  def success?
    self['class'].split(" ").include?("flash-notice")
  end

  def error?
    self['class'].split(" ").include?("flash-error")
  end
end
