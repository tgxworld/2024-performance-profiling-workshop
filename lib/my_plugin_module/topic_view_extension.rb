# frozen_string_literal: true

module MyPluginModule
  module TopicViewExtension
    extend ActiveSupport::Concern

    def unfiltered_posts
      MyPluginModule::Fibonacci.fib(30) if @topic.id == ::MyPluginModule::SLOW_TOPIC_ID
      super
    end
  end
end
