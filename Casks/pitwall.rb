# Filled in and pushed to the tap by `make cask`.
cask "pitwall" do
  version "0.3.6"
  sha256 "16dcf0afe378d33397c42836814ff29e3730581a1304f6a4589e48bf92e25412"

  url "https://github.com/jason-shen/pitwall/releases/download/v#{version}/Pitwall-#{version}-macos.zip"
  name "Pitwall"
  desc "Agentic IDE: run, review and merge coding agents"
  homepage "https://pitwallide.com"

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
