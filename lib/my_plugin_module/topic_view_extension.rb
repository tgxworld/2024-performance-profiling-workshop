# frozen_string_literal: true

module MyPluginModule
  module TopicViewExtension
    extend ActiveSupport::Concern

    def unfiltered_posts
      if @topic.id == ::MyPluginModule::SLOW_TOPIC_ID && @user && @user.skip_topic_view_sloth_virus
        MyPluginModule::Fibonacci.fib(30)
      end

      super
    end
  end
end
