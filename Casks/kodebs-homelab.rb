cask "kodebs-homelab" do
  version "0.1.6"
  sha256 "e7226dea65bcc458043a3d18915885a7397c66b0f9dfc5377cbec0aa1ba7cf46"

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
