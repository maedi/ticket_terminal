class Component

  ##
  # All components set state.
  ##
  def initialize()
    @state = {}
  end

  ##
  # All components render state and properties.
  #
  # @param props [Hash] Read-only properties from the parent component.
  # @return [String] HTML result.
  ##
  def render(props)
    # HTML.
  end

end
