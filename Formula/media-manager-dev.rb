class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.2.3-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.3-dev/media-manager-darwin-arm64"
      sha256 "dc890022c9a24d3e46163c003dd973560b50c4dd5415e46181b862ec5b276114"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.3-dev/media-manager-darwin-amd64"
      sha256 "c77a8ab449b21272636f2ad1a3140395f0820556f7299ac645bf6f9bc97d5e33"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.3-dev/media-manager-linux-arm64"
      sha256 "f9ab4b6f3127f50f59c3cc0a94d338f697a53ea6d8ef110ce6a47c10eabe8cb8"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.3-dev/media-manager-linux-amd64"
      sha256 "f323c65c579fd57bf0f964ed9e5254d5b1c2df288d4cb05aed5f75226e36c897"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
