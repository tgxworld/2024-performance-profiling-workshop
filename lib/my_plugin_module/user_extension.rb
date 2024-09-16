# frozen_string_literal: true

module MyPluginModule
  module UserExtension
    extend ActiveSupport::Concern

    def skip_post_serializer_sloth_virus
      self.uploaded_avatar&.dominant_color == "565B8C"
    end
  end
end
