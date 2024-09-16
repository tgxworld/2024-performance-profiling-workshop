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
  end
end
