cask "kodebs-homelab" do
  version "0.1.4"
  sha256 "80125d73dc9a60c27483d78cfa9d0f2d9a664570e87eb28ee3a679335adf6462"

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
