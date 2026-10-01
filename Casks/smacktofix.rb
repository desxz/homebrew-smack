cask "smacktofix" do
  version "1.0.4"
  sha256 "18547f01856fcb8ac4d2a976f2e3d7c29d78cb8d9b51125c087571f5cee01f9f"

  url "https://github.com/desxz/sMACk/releases/download/v#{version}/SmackToFix.zip"
  name "sMACk"
  desc "Percussive maintenance for Mac. The Mac is already in the word."
  homepage "https://github.com/desxz/sMACk"

  depends_on macos: :sonoma

  app "sMACk.app"

  # The build is ad-hoc signed. Homebrew copies the download quarantine
  # flag onto the app, and macOS then refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/sMACk.app"]
  end

  zap trash: "~/Library/Preferences/com.smacktofix.SmackToFix.plist"
end
