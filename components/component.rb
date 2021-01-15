require 'reflekt'
require_relative '../helpers/app_helper.rb'

class Component

  prepend Reflekt
  include AppHelper

  reflekt_skip :render

  ##
  # All components have state and params.
  ##
  def initialize(params = nil)
    @params = params
    @state = {}
  end

  ##
  # All components render HTML.
  #
  # @param props [Hash] Read-only properties from the parent component.
  # @return [String] HTML result.
  ##
  def render(props)
    # HTML.
  end

end
