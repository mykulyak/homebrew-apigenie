# Template for Formula/apigenie.rb in the mykulyak/homebrew-apigenie tap. The release tool
# (`npm run release -- publish cli`, see docs/releasing.md) fills in the @...@ placeholders.
class Apigenie < Formula
  desc "Tools for OpenAPI development, with code generators, a mock server and a catalog"
  homepage "https://apigenie.pl"
  # Linux x86_64; the macOS block below overrides it on Apple silicon, and the depends_on lines
  # keep the formula off the systems without a binary (every system needs some url for
  # `brew readall --os=all --arch=all`, and brew style wants url, version, sha256 in this order)
  url "https://github.com/mykulyak/api-genie/releases/download/cli-0.12.0/apigenie-0.12.0-linux-x64.tar.gz"
  version "0.12.0"
  sha256 "8fc69da79c5d6cc4a0ca8401be3003dc9db87826636faa351972a82d35d18845"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/mykulyak/api-genie/releases/download/cli-0.12.0/apigenie-0.12.0-macos-arm64.zip"
      sha256 "a8bc9a8e365c779e787c20b14a3ea0850408e75c57641d0dfa0ea006e2003b18"
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
