class WbhCampusScraper < Formula
  include Language::Python::Virtualenv

  desc "Extract and process study program data from WBH Online Campus HTML exports"
  homepage "https://github.com/jonaskern-dev/wbh-campus-scraper"
  url "https://github.com/jonaskern-dev/wbh-campus-scraper/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "0462824c75e91bfd4de494296673779430b0d0d650fc8c188fb010617d29bf4a"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Test that the command exists and shows help
    assert_match "usage:", shell_output("#{bin}/wbh-scraper --help")
  end
end
