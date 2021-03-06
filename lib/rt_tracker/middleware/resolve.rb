# auto_register: false

require 'dry/effects'

module RtTracker
  module Middleware
    class Resolve
      include ::Dry::Effects::Handler.Resolve

      def initialize(app)
        @app = app
        @overridable = App['env.test']
      end

      def call(env)
        provide(App, overridable: @overridable) { @app.(env) }
      end
    end
  end
end
