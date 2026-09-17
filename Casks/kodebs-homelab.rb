cask "kodebs-homelab" do
  version "0.1.5"
  sha256 "2c2d3d0c0c4ff8be994520e4b0157924dff265b2ab5154856b1cc9fc6f537c60"

  url "https://github.com/KodeBS/homebrew-tap/releases/download/v#{version}/KodeBS-Homelab-#{version}-arm64.dmg"
  name "KodeBS Homelab"
  desc "Docker, ports, background tasks and AI/GitHub menu bar items for this Mac"
  homepage "https://github.com/KodeBS/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "KodeBS Homelab.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/KodeBS Homelab.app"]
  end

  zap trash: [
    "~/Library/Application Support/KodeBS_Homelab",
    "~/Library/Application Support/KodeBS Homelab",
    "~/Library/LaunchAgents/com.kodebs.homelab.plist",
  ]
end
