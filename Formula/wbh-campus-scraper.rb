class WbhCampusScraper < Formula
  include Language::Python::Virtualenv

  desc "Extract and process study program data from WBH Online Campus HTML exports"
  homepage "https://github.com/jonaskern-dev/wbh-campus-scraper"
  url "https://github.com/jonaskern-dev/wbh-campus-scraper/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5ea252848e942ec711c74c9bfb416018605786e68e5e1c26a9933d0270a0dceb"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Test that the command exists and shows help
    assert_match "usage:", shell_output("#{bin}/wbh-extract --help")
  end
end
