cask "apigenie" do
  version "0.8.0"
  sha256 "c95782d5d20ed1a631abf0505d8bd04906685e825244cd645f91dc18e00b499e"

  url "https://apigenie.pl/dist/#{version}/apigenie-#{version}-macos_14-arm64.zip"
  name "apigenie"
  desc "Best software for OpenAPI development"
  homepage "https://apigenie.pl/"

  livecheck do
    url :url
    strategy :header_match
  end

  depends_on macos: ">= :sonoma"

  binary "apigenie-#{version}-macos_14-arm64", target: "apigenie"
end
