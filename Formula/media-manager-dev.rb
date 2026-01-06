class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.3.1-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.1-dev/media-manager-darwin-arm64"
      sha256 "ea796462c53c30d81461b1f4e246a394cb8ed954afc26a5ae34897635cce88fb"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.1-dev/media-manager-darwin-amd64"
      sha256 "338366661c52bdd0e54814b530fc5f7a915b4e978056db34c06bcca4ad2562dc"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.1-dev/media-manager-linux-arm64"
      sha256 "6fdf885ecacbd34179aa9a57241d04b7c6456a6909618bb992c4394f4423341c"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.3.1-dev/media-manager-linux-amd64"
      sha256 "661399182d35650cef6485ca30fe2ae45c059a82ee33a30f572556c3c6adbadc"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
