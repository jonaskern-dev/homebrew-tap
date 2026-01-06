class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.2.2-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.2-dev/media-manager-darwin-arm64"
      sha256 "e132eba8804ee867b8a907d22a24cc8765dbc7b0e185e7ec3f20751bbbd09a84"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.2-dev/media-manager-darwin-amd64"
      sha256 "67a195911701af344083f15eb28ae4f1a7bd35237b6ac036dc2e22a65cf8fc91"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.2-dev/media-manager-linux-arm64"
      sha256 "d7e1c50a2a967712c592ce5bde01c93cd5ecb7f3cad4a7fcf8dc78c1d10d1f12"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.2-dev/media-manager-linux-amd64"
      sha256 "a45991244c6e9b473ca91cae0acda0cb2549851dc969a9ad12652839a93a11ac"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
