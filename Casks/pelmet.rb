# Canonical source for the Pelmet Homebrew cask.
#
# This file is the source of truth. `scripts/bootstrap-tap.sh` seeds it into the
# ismatBabirli/homebrew-pelmet tap, and the release workflow keeps the tap copy's
# `version` + `sha256` in sync on every tagged release.
#
# The sha256 below is a placeholder until the first release is cut; the release
# workflow overwrites it with the real DMG checksum.
cask "pelmet" do
  version "0.6.1"
  sha256 "8f2f1e3abac9bfac9f62c765138c55104d5fd49441c42df87bc32467b17007ca"

  url "https://github.com/ismatBabirli/pelmet/releases/download/v#{version}/Pelmet-#{version}.dmg",
      verified: "github.com/ismatBabirli/pelmet/"
  name "Pelmet"
  desc "Menu bar organizer that reclaims the icons a MacBook notch hides"
  homepage "https://pelmet.xyz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Pelmet.app"

  zap trash: [
    "~/Library/Preferences/com.ismatbabirli.Pelmet.plist",
    "~/Library/Application Support/Pelmet",
    "~/Library/Caches/com.ismatbabirli.Pelmet",
    "~/Library/HTTPStorages/com.ismatbabirli.Pelmet",
  ]
end
