cask "kodebs-homelab" do
  version "0.1.3"
  sha256 "bb232aa42c4267ae2d2d5561658ba56e0805aedaf4db4c1a7838b9aeb14f1fce"

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
