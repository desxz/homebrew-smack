cask "smacktofix" do
  version "1.0.1"
  sha256 "4c01d629a5d252baa5f7353c51558f85b7b9483b9d9f73e374d9a83867ca67bb"

  url "https://github.com/desxz/SmackToFix/releases/download/v#{version}/SmackToFix.zip"
  name "SmackToFix"
  desc "Percussive maintenance for Mac"
  homepage "https://github.com/desxz/SmackToFix"

  depends_on macos: :sonoma

  app "SmackToFix.app"

  # The build is ad-hoc signed. Homebrew copies the download quarantine
  # flag onto the app, and macOS then refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/SmackToFix.app"]
  end

  zap trash: "~/Library/Preferences/com.smacktofix.SmackToFix.plist"
end
