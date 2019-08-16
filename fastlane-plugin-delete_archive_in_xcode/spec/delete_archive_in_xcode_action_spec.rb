describe Fastlane::Actions::DeleteArchiveInXcodeAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The delete_archive_in_xcode plugin is working!")

      Fastlane::Actions::DeleteArchiveInXcodeAction.run(nil)
    end
  end
end
