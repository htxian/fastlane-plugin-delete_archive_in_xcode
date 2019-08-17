require 'fastlane/action'
require_relative '../helper/delete_archive_in_xcode_helper'

module Fastlane
  module Actions
    class DeleteArchiveInXcodeAction < Action
      def self.run(params)
        UI.message("The delete_archive_in_xcode plugin is working!")
        
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        #        UI.message "Parameter API Token: #{params[:api_token]}"
        UI.message("需要删除的路径😄 #{params[:remove_path]} ")
        removePath = params[:remove_path]
        #因为gym 导出的archive 文件是带空格的，使用rm -rf 时删除失败
        #正常来说使用 sed 's/ /\\ / g'就可以把空格替换成 "\ "了。。但是打印出来的结果是还没替换成空格，
        #我就试着再加两个空格，就变成 sed 's/ /\\\\ / g'。。。。居然成功了。。
        safeRemovePath = Actions.sh("echo #{removePath} | sed 's/ /\\\\ / g'")
        UI.message(safeRemovePath)
        #删除
        result = Actions.sh("rm -rf #{safeRemovePath}")
        UI.message("执行完毕 BztestAction 的操作 🚀 #{result}")
      end

      def self.description
        "delete archiv in xcode organizer archives file"
      end

      def self.authors
        ["xian"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "when we use gym build ipa, gym autoSave archive file in Xcode orgnianizer archives, we want to delete it from xcode."
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :remove_path,
                                 description: "需要删除的路径",
                                   is_string: true, # true: verifies the input is a string, false: every kind of value
                             default_value: false) # the default value if the user didn't provide one
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
