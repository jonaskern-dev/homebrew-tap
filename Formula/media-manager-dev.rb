class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.2.1-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.1-dev/media-manager-darwin-arm64"
      sha256 "8f8b58a632217b651ae731d2445ff265229074a38910ac99279aabb8d64ae1c5"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.1-dev/media-manager-darwin-amd64"
      sha256 "1a8fd31132a54e2f6965fe3e9679c26d6920984358b64881363e6392d3a21574"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.1-dev/media-manager-linux-arm64"
      sha256 "d76b4d5c944ee4842b2af6c114b4b4bb17ea819673520234b32f2c37baf40797"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.1-dev/media-manager-linux-amd64"
      sha256 "439271572457198fe648cb6d90d0c9c9152e1bf246742a521d6c429cec7ea783"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
