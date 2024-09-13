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
end

require_relative "lib/my_plugin_module/engine"

after_initialize do
  if !ENV["SOLVED_PROBLEM_1"]
    # Triggers a ridiculous amount of queries to demonstrate N+1 queries on Topic List page
    add_to_serializer(:topic_list_item, :special_title, include_condition: -> { true }) do
      50.times { DB.query("SELECT title FROM topics WHERE id = #{object.id.to_i}").first.title }
    end
  end

  if !ENV["SOLVED_PROBLEM_2"]
    # Triggers a slow query on Topic List page
    add_to_serializer(:topic_list, :some_special_attribute, include_condition: -> { true }) do
      DB.query("SELECT pg_sleep(5)")
    end
  end

  reloadable_patch do
    if !ENV["SOLVED_PROBLEM_3"]
      # Make the topic list page slow
      TopicQuery.prepend ::MyPluginModule::TopicQueryExtension
    end
  end
end
