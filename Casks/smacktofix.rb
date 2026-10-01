cask "smacktofix" do
  version "1.0.2"
  sha256 "7abad3c1f77b0bdd28ec8102c3828d4ef8d5ba970bf52dcf74afd48b51fe49ea"

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
