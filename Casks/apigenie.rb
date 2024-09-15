cask "apigenie" do
  version "0.8.0"
  sha256 "b28953aa12ada9ab49788c396571a964d2bd5b369492ec20c9a8fcd052b9082b"

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
