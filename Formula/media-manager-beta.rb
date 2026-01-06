class MediaManagerBeta < Formula
  desc "Media automation platform (beta/development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.1.0-alpha.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.3/media-manager-darwin-arm64"
      sha256 "d2cd396ed9da178d4247fe96afa9cd298558d182b2e0c21c83204ba8d018a4f9"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.3/media-manager-darwin-amd64"
      sha256 "865e3594559a5b96a856632040ab919bc308843c8d171c372a1974e85aac5f29"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.3/media-manager-linux-arm64"
      sha256 "1d5408d5b6bf79314ac9f4460cf4eb56f25f5b77b773c92171b11e87cb150453"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.3/media-manager-linux-amd64"
      sha256 "651320c968baa891c21d2c7d5c4b1c6182a531d3bf118658179a2e24042de792"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
