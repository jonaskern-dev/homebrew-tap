class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.3.0-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.0-dev/media-manager-darwin-arm64"
      sha256 "1a575d49470d36862084e1a837840ec1e3eef24738553261a88671873a28ec5e"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.0-dev/media-manager-darwin-amd64"
      sha256 "ac28fe0a38218feb1bebc8a6855f9243e436e4739ed2161c507eb103ad88b852"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.0-dev/media-manager-linux-arm64"
      sha256 "dc42b7f0bab829e9bda632afe4eeacdfaa612e39395b12de3fc1142c56c33223"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.0-dev/media-manager-linux-amd64"
      sha256 "179857e4dcbaa856effaefa92d7125819f24b358d0dcbd2d414346d1de244665"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
