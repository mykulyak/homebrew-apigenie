# Template for Formula/apigenie.rb in the mykulyak/homebrew-apigenie tap. The release tool
# (`npm run release -- publish cli`, see docs/releasing.md) fills in the @...@ placeholders.
class Apigenie < Formula
  desc "Tools for OpenAPI development, with code generators, a mock server and a catalog"
  homepage "https://apigenie.pl"
  # Linux x86_64; the macOS block below overrides it on Apple silicon, and the depends_on lines
  # keep the formula off the systems without a binary (every system needs some url for
  # `brew readall --os=all --arch=all`, and brew style wants url, version, sha256 in this order)
  url "https://github.com/mykulyak/api-genie/releases/download/cli-0.10.0/apigenie-0.10.0-linux-x64.tar.gz"
  version "0.10.0"
  sha256 "555c290c418e989cbdf88961ed9cc04c18689a9d103aa0cabb5be61ad00dc553"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/mykulyak/api-genie/releases/download/cli-0.10.0/apigenie-0.10.0-macos-arm64.zip"
      sha256 "786ab51a2744d76de5953b3127908b8d7a24bfaf5571ec0073763ceef77682e0"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "apigenie", "apigenie-generator", "apigenie-server", "apigenie-catalog"
    # the deprecated name of apigenie-server, until 1.1
    bin.install_symlink "apigenie-server" => "apigenie-mock"
  end

  test do
    # the first line is the version; the other binaries' versions follow
    assert_equal version.to_s, shell_output("#{bin}/apigenie --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-generator --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-server --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-mock --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-catalog --version").lines.first.strip
  end
end
