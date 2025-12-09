class WbhCampusScraper < Formula
  include Language::Python::Virtualenv

  desc "Extract and process study program data from WBH Online Campus HTML exports"
  homepage "https://github.com/jonaskern-dev/wbh-campus-scraper"
  url "https://github.com/jonaskern-dev/wbh-campus-scraper/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "b01acbb9c2fe9b17c0ff145bb38d2f3eaa8dbfd74b97bf53467de61f71396d6d"
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
