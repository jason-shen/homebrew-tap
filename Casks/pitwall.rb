# Filled in and pushed to the tap by `make cask`.
cask "pitwall" do
  version "0.1.0"
  sha256 "1c5181167aff4553487291fd835931cc3db5a3613839a661491e14263124e4fa"

  url "https://github.com/jason-shen/pitwall/releases/download/v#{version}/Pitwall-#{version}-macos.zip"
  name "Pitwall"
  desc "Agentic IDE: run, review and merge coding agents"
  homepage "https://github.com/jason-shen/pitwall"

  depends_on macos: ">= :big_sur"

  app "Pitwall.app"
  binary "#{appdir}/Pitwall.app/Contents/MacOS/pitwall"

  # Signed ad hoc rather than notarized, so Gatekeeper would refuse to open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Pitwall.app"]
  end

  zap trash: [
    "~/.config/pitwall",
    "~/.pitwall",
  ]
end
