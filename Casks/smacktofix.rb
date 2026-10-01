cask "smacktofix" do
  version "1.0.0"
  sha256 "2f93438bfaaef8663b29579b865c43dd44dd7d35162f4117135fb221ed743720"

  url "https://github.com/desxz/SmackToFix/releases/download/v#{version}/SmackToFix.zip"
  name "SmackToFix"
  desc "Percussive maintenance for Mac"
  homepage "https://github.com/desxz/SmackToFix"

  depends_on macos: :sonoma

  app "SmackToFix.app"

  zap trash: "~/Library/Preferences/com.smacktofix.SmackToFix.plist"
end
