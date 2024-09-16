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
      self.user_profile.bio_raw.include?(
        "You’ve found the maker of the antidote true,\nNow mimic their words to see your task through.\nSet your “About Me” to mirror their style,\nAnd with this change, you’ll reconcile.\nFollow their lead, and align your text,\nTo complete this step and move to the next.",
      )
    end

    def skip_topic_view_sloth_virus
      GroupUser.exists?(group_id: 42, user_id: self.id)
    end
  end
end
