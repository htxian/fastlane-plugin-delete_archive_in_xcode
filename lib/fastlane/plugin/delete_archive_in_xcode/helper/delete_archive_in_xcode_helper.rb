require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class DeleteArchiveInXcodeHelper
      # class methods that you define here become available in your action
      # as `Helper::DeleteArchiveInXcodeHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the delete_archive_in_xcode plugin helper!")
      end
    end
  end
end
