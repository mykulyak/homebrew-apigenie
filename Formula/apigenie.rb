# Template for Formula/apigenie.rb in the mykulyak/homebrew-apigenie tap. The release tool
# (`npm run release -- publish cli`, see docs/releasing.md) fills in the @...@ placeholders.
class Apigenie < Formula
  desc "Tools for OpenAPI development, with code generators, a mock server and a catalog"
  homepage "https://api-genie.dev"
  # Linux x86_64; the macOS block below overrides it on Apple silicon, and the depends_on lines
  # keep the formula off the systems without a binary (every system needs some url for
  # `brew readall --os=all --arch=all`, and brew style wants url, version, sha256 in this order)
  url "https://github.com/mykulyak/api-genie/releases/download/cli-0.13.0/apigenie-0.13.0-linux-x64.tar.gz"
  version "0.13.0"
  sha256 "72a85d57357cfe53ddc0e29319db8b90681b49b8ca1353323c188654c4ffc4e0"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/mykulyak/api-genie/releases/download/cli-0.13.0/apigenie-0.13.0-macos-arm64.zip"
      sha256 "72d13b0c52c7836800d7a19c1dcf704f72948bdae441c892d16f503470ae7d61"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "apigenie", "apigenie-generator", "apigenie-server", "apigenie-catalog",
                "apigenie-mcp"
  end

  test do
    # the first line is the version; the other binaries' versions follow
    assert_equal version.to_s, shell_output("#{bin}/apigenie --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-generator --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-server --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-catalog --version").lines.first.strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-mcp --version").lines.first.strip
  end
end
