class MediaManagerDev < Formula
  desc "Media automation platform (development version)"
  homepage "https://github.com/jonaskern-dev/media-manager"
  version "0.2.0-dev"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.0-dev/media-manager-darwin-arm64"
      sha256 "0b9606886b1b9e5fc9ad3d721335f76b3a01e00742bf90006a10a29783bc786e"
      def install
        bin.install "media-manager-darwin-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.0-dev/media-manager-darwin-amd64"
      sha256 "7f0ac5ce4ecd06652de17460775bba51aa9825379ab23e7edd25fee074b21c5f"
      def install
        bin.install "media-manager-darwin-amd64" => "media-manager"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.0-dev/media-manager-linux-arm64"
      sha256 "f72c352096d42db5af1015347256afb8119f58510f9241d8eb721a0e38c4064d"
      def install
        bin.install "media-manager-linux-arm64" => "media-manager"
      end
    else
      url "https://github.com/jonaskern-dev/media-manager/releases/download/v0.2.0-dev/media-manager-linux-amd64"
      sha256 "d36c88209fa08e9b02759d9b81248c987f81491dae40ca12f8af62cdcdf4d75e"
      def install
        bin.install "media-manager-linux-amd64" => "media-manager"
      end
    end
  end

  test do
    system "\#{bin}/media-manager", "--version"
  end
end
