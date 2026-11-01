# Template for Formula/apigenie.rb in the mykulyak/homebrew-apigenie tap. The release tool
# (`npm run release -- publish cli`, see docs/releasing.md) fills in the @...@ placeholders.
class Apigenie < Formula
  desc "Tools for OpenAPI development, with code generators, a mock server and a catalog"
  homepage "https://apigenie.pl"
  # Linux x86_64; the macOS block below overrides it on Apple silicon, and the depends_on lines
  # keep the formula off the systems without a binary (every system needs some url for
  # `brew readall --os=all --arch=all`, and brew style wants url, version, sha256 in this order)
  url "https://github.com/mykulyak/api-genie/releases/download/cli-0.11.0/apigenie-0.11.0-linux-x64.tar.gz"
  version "0.11.0"
  sha256 "fe8b8197d923079afdd49fa4f50f729e77f95e394f9b8e7484ca85ff351e7417"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/mykulyak/api-genie/releases/download/cli-0.11.0/apigenie-0.11.0-macos-arm64.zip"
      sha256 "890b44834cabf7a1f335912b9af5638fee609e20e6313af934d116e44c8276a6"
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
