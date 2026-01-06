class MediaManagerBeta < Formula
  desc "Media automation platform (beta/development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.1.0-alpha.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.4/media-manager-darwin-arm64"
      sha256 "dc48c72e2dfff9377d3b28a0a62a02a6fc9200e72119686f4a0ff70a727f2dc3"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.4/media-manager-darwin-amd64"
      sha256 "52c8d6076a6644c5419efc31466f2574c5059a2a3e15cd762c065a8b359437ad"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.4/media-manager-linux-arm64"
      sha256 "882ed06ed6cb734060db66059a2e6322330a98ca04161d7fe4a72c6ec1854432"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.1.0-alpha.4/media-manager-linux-amd64"
      sha256 "debdab04e63e98176834b2ceb7594863c7c35e7ea6a4437824e9bd8a51a1fe0a"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
