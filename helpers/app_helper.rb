#require 'sinatra/base'
#
#module Sinatra
#  module AppHelper
#
#    #include Sinatra::Helpers
#    include Sinatra::Templates
#
#    # Expose app settings to components.
#    def settings
#      @settings ||= App.settings
#    end
#
#    def template(props, template)
#      erb template.to_sym
#    end
#
#  end
#
#  register AppHelper
#end
