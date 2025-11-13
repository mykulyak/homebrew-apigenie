cask "apigenie" do
  version "0.8.2"
  sha256 "077c04cf1ed1dc484efa3cecf81cf99b6cf84eb97a6c37bca4fe5d0fb0912c62"

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
