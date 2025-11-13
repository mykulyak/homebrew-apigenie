cask "apigenie" do
  version "0.8.2"
  sha256 "e27b2208e7d0c5f0c41d44bfd882b92b67b75a17c2350016f9a5c529a7cca52c"

  # url "https://apigenie.pl/dist/#{version}/apigenie-#{version}-macos_14-arm64.zip"
  url "https://storage.googleapis.com/apigenie.pl/dist/#{version}/apigenie-#{version}-macos_15-arm64.zip",
      verified: "storage.googleapis.com/apigenie.pl/"
  name "apigenie"
  desc "Best software for OpenAPI development"
  homepage "https://apigenie.pl/"

  livecheck do
    url :url
    strategy :header_match
  end

  depends_on macos: ">= :sonoma"

  binary "apigenie-#{version}-macos_15-arm64", target: "apigenie"
end
