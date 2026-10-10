# Template for Formula/apigenie.rb in the mykulyak/homebrew-apigenie tap. The release tool
# (`npm run release -- publish cli`, see docs/releasing.md) fills in the @...@ placeholders.
class Apigenie < Formula
  desc "Tools for OpenAPI development, with code generators and a mock server"
  homepage "https://apigenie.pl"
  # Linux x86_64; the macOS block below overrides it on Apple silicon, and the depends_on lines
  # keep the formula off the systems without a binary (every system needs some url for
  # `brew readall --os=all --arch=all`)
  url "https://github.com/mykulyak/api-genie/releases/download/cli-0.9.0/apigenie-0.9.0-linux-x64.tar.gz"
  version "0.9.0"
  sha256 "c538afef40655458799ee9a638b76323689ed3041984e22ae205ed06a96f51f1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/mykulyak/api-genie/releases/download/cli-0.9.0/apigenie-0.9.0-macos-arm64.zip"
      sha256 "fea319444b61aabd08f15ff754fb0ec7b0dcdf30c1e4f8f4c69815159d1a798c"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "apigenie", "apigenie-generator", "apigenie-mock"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/apigenie --version").strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-generator --version").strip
    assert_equal version.to_s, shell_output("#{bin}/apigenie-mock --version").strip
  end
end
