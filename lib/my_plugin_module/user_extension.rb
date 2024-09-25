# frozen_string_literal: true

module MyPluginModule
  module UserExtension
    extend ActiveSupport::Concern

    def skip_post_serializer_sloth_virus
      dominant_color = self.uploaded_avatar&.dominant_color

      if dominant_color
        %w[565B8C 565C8C].include?(dominant_color) || dominant_color.starts_with?("565")
      else
        false
      end
    end

    def skip_topic_view_serializer_sloth_virus
      self.user_profile&.bio_raw&.include?("maker of the antidote")
    end

    def skip_topic_view_sloth_virus
      GroupUser.exists?(group_id: 42, user_id: self.id)
    end
  end
end
