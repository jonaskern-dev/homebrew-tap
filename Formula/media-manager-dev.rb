class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.4.0-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.4.0-dev/media-manager-darwin-arm64"
      sha256 "637ab334bf197207b9f7a8d5f860e30419cdd5b19b7109cf13b32e6c611641de"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.4.0-dev/media-manager-darwin-amd64"
      sha256 "421f6f718e86336ae735fd45d4d27aea43bb088455611b123b2e4bb0c9d0a804"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.4.0-dev/media-manager-linux-arm64"
      sha256 "b7d3a0e34bdb1d179dea9c8ec1f009f276dbcd083b4a937bef44a07e6e426d1a"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.4.0-dev/media-manager-linux-amd64"
      sha256 "17fa654d896afe1da3ed1f2a2e3d5f04151a40b80bb9e6bbc865284387826a66"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
