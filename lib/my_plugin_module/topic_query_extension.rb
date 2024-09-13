# frozen_string_literal: true

module MyPluginModule
  module TopicQueryExtension
    extend ActiveSupport::Concern

    def default_results(*args)
      MyPluginModule::Fibonacci.fib(30)
      super
    end
  end
end
