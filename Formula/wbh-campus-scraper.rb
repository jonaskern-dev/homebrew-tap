class WbhCampusScraper < Formula
  include Language::Python::Virtualenv

  desc "Extract and process study program data from WBH Online Campus HTML exports"
  homepage "https://github.com/jonaskern-dev/wbh-campus-scraper"
  url "https://github.com/jonaskern-dev/wbh-campus-scraper/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "00dc51be539510304d52f034b25960961f550e9bb3c627ebc1c7d140b41e02b6"
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
