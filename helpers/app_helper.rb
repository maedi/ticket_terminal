module AppHelper

  # Project path.
  @@root = nil

  # Expose app to components.
  def set_app(app)
    @@app ||= app
  end

end
