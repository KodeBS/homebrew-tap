cask "kodebs-homelab" do
  version "0.1.2"
  sha256 "aea118d7e28f24e70d38b37146b9411a33bec5608e6c91ff4d4512d6e9940ef8"

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
    "~/Library/Application Support/KodeBS Homelab",
    "~/Library/LaunchAgents/com.kodebs.homelab.plist",
  ]
end
