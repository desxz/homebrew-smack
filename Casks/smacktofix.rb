cask "smacktofix" do
  version "1.0.3"
  sha256 "b82320c6eb3cffe119812930027e9bd0ad0c4dca9dd78e92e59b74f2cefd884a"

  url "https://github.com/desxz/SmackToFix/releases/download/v#{version}/SmackToFix.zip"
  name "sMACk"
  desc "Percussive maintenance for Mac. The Mac is already in the word."
  homepage "https://github.com/desxz/SmackToFix"

  depends_on macos: :sonoma

  app "sMACk.app"

  # The build is ad-hoc signed. Homebrew copies the download quarantine
  # flag onto the app, and macOS then refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/sMACk.app"]
  end

  zap trash: "~/Library/Preferences/com.smacktofix.SmackToFix.plist"
end
