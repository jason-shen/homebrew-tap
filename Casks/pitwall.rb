# Filled in and pushed to the tap by `make cask`.
cask "pitwall" do
  version "0.1.1"
  sha256 "e55fca09b54d3f5864e889e55bb5383c9a46abd889817a897f14c9c3ade50eb7"

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
