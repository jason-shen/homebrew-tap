# Filled in and pushed to the tap by `make cask`.
cask "pitwall" do
  version "0.2.0"
  sha256 "b2d00c4dfd2b5e393fe4fbb7d269c78f2b8703ef551051309abbd2d8c62a39bd"

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
