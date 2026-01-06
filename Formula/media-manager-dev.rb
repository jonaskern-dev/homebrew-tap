class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.3.2-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.2-dev/media-manager-darwin-arm64"
      sha256 "e08025a7336d206f4dcc3c3eae23ded312ba7d553a3d46a1cbc02c8e10aeb392"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.2-dev/media-manager-darwin-amd64"
      sha256 "5eca57e7a7a28d96fd84ce843b9b65274241bf3d9051d4a754f2d370ca3ce7f5"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.2-dev/media-manager-linux-arm64"
      sha256 "71ed4475662fec689e215a3897bb41b90240908401603fda8854b705347a161c"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.2-dev/media-manager-linux-amd64"
      sha256 "e1829b30200d277d813e80a73ec5fdb9cbbda681d703abb9b28f985e56ce55e9"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
