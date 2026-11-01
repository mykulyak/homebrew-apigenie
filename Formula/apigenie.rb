# Template for Formula/apigenie.rb in the mykulyak/homebrew-apigenie tap. The release tool
# (`npm run release -- publish cli`, see docs/releasing.md) fills in the @...@ placeholders.
class Apigenie < Formula
  desc "Tools for OpenAPI development, with code generators, a mock server and a catalog"
  homepage "https://apigenie.pl"
  # Linux x86_64; the macOS block below overrides it on Apple silicon, and the depends_on lines
  # keep the formula off the systems without a binary (every system needs some url for
  # `brew readall --os=all --arch=all`, and brew style wants url, version, sha256 in this order)
  url "https://github.com/mykulyak/api-genie/releases/download/cli-0.11.1/apigenie-0.11.1-linux-x64.tar.gz"
  version "0.11.1"
  sha256 "a8c8f27e7dc84b89e0fe94482b83c0d668a545ba30a709d97e1cbc32965ab7fd"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/mykulyak/api-genie/releases/download/cli-0.11.1/apigenie-0.11.1-macos-arm64.zip"
      sha256 "76bf7fc17ae2005fdbf20ab4bf959bc669b86c1fab683af6cf1c1b5f99a7feb0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "apigenie", "apigenie-generator", "apigenie-server", "apigenie-catalog"
  end

  test do
    # the first line is the version; the other binaries' versions follow
    assert_equal version.to_s, shell_output("#{bin}/apigenie --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-generator --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-server --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-catalog --version").lines.first.strip
  end
end
