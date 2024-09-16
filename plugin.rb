# frozen_string_literal: true

# name: discourse-plugin-name
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Discourse
# url: TODO
# required_version: 2.7.0

enabled_site_setting :plugin_name_enabled

module ::MyPluginModule
  PLUGIN_NAME = "discourse-plugin-name"
  SLOW_TOPIC_ID = 102
end

require_relative "lib/my_plugin_module/engine"

after_initialize do
  # Triggers a ridiculous amount of queries to demonstrate N+1 queries on Topic View page
  add_to_serializer(
    :post,
    :sloth_virus,
    include_condition: -> do
      object.topic_id == ::MyPluginModule::SLOW_TOPIC_ID && scope.user &&
        !scope.user.skip_post_serializer_sloth_virus
    end,
  ) { 50.times { Post.where(id: object.id).annotate(<<~SQL).pick(:post_number) } }
      Search in the forum, where mysteries hide. For the clues that performance guides. N+1 is the puzzle you seek. Queries in posts will help you peek.
      SQL

  # Triggers a slow query on Topic View page
  add_to_serializer(
    :topic_view,
    :sloth_virus,
    include_condition: -> { object.topic.id == ::MyPluginModule::SLOW_TOPIC_ID },
  ) { DB.query("SELECT pg_sleep(5)") }

  reloadable_patch do
    # Make the topic list page slow
    TopicView.prepend ::MyPluginModule::TopicViewExtension
    User.prepend ::MyPluginModule::UserExtension
  end
end
