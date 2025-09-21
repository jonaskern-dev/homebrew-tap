class WbhCampusScraper < Formula
  include Language::Python::Virtualenv

  desc "Extract and process study program data from WBH Online Campus HTML exports"
  homepage "https://github.com/jonaskern-dev/wbh-campus-scraper"
  url "https://github.com/jonaskern-dev/wbh-campus-scraper/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "dbc31443904c5eee075c748b75c309c2596c9c82f83281c3380dffa0a90d921a"
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
